using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(XjzzDatabase.Startup))]
namespace XjzzDatabase
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
