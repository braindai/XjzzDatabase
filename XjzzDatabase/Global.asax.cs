﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Data.Entity;
using XjzzDatabase.Models;
using XjzzDatabase.Logic;

namespace XjzzDatabase
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // 在应用程序启动时运行的代码
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
 //           Database.SetInitializer(new XjzzDatabaseInitializer());

            RoleActions roleActions = new RoleActions();
            roleActions.AddUserAndRole();
        }
    }
}