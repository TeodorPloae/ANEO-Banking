using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using PSGBD_Project.Models;
using System.Web;
using System.Web.UI;
//using System.Web.UI.WebControls;
using Microsoft.SqlServer.Management.Smo;
using Microsoft.SqlServer.Management.Common;
using System.IO;
using System.Data.SqlClient;

namespace PSGBD_Project.Controllers
{
    
    public class HomeController : Controller
    {
        private static string connection = @"//localhost:1521/xe; User ID=PROJECT; Password=PROJECT";

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [HttpGet("TEST")]
        public IActionResult Test()
        {
            //Method 1 (Hard coded connection string)  
            services.AddDbContext<MyDbContext>(options => options.UseSqlServer(connection));
        }
    }

    //public partial class ExcuteScript : System.Web.UI.Page
    //{
    //    protected void Page_Load(object sender, EventArgs e)
    //    {
    //        string sqlConnectionString = @"Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=ccwebgrity;Data Source=SURAJIT\SQLEXPRESS";

    //        string script = File.ReadAllText(@"E:\Project Docs\MX462-PD\MX756_ModMappings1.sql");

    //        SqlConnection conn = new SqlConnection(sqlConnectionString);

    //        Server server = new Server(new ServerConnection(conn));

    //        server.ConnectionContext.ExecuteNonQuery(script);
    //    }
    //}
}
