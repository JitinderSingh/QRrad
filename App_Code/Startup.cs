using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(QRrad.Startup))]
namespace QRrad
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
