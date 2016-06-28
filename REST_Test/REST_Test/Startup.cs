using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(REST_Test.Startup))]
namespace REST_Test
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
