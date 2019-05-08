using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using static System.Net.Mime.MediaTypeNames;

namespace NguyenHoangLaptop
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            Application["SoNguoiTruyCap"] = 0;
            Application["SoNguoiOnline"] = 0;
        }
        protected void Session_Start()
        {
            Application.Lock(); // Dùng để đồng bộ hóa 
            Application["SoNguoiTruyCap"] = (int)Application["SoNguoiTruyCap"] + 1;
            Application["SoNguoiOnline"] = (int)Application["SoNguoiOnline"] + 1;
            Application.UnLock();
        }
        public void Session_End()
        {
            Application.Lock();
            Application["SoNguoiOnline"] = (int)Application["SoNguoiOnline"] - 1;
            Application.UnLock();
        }
        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

            HttpCookie TaiKhoanCookie = Context.Request.Cookies[FormsAuthentication.FormsCookieName];
            if (TaiKhoanCookie != null)
            {
                var authTicket = FormsAuthentication.Decrypt(TaiKhoanCookie.Value);
                var Quyen = authTicket.UserData.Split(new Char[] { ',' });
                GenericPrincipal userPrincipal = new GenericPrincipal(new GenericIdentity(authTicket.Name), Quyen);
                Context.User = userPrincipal;
            }
        }
    }
}
