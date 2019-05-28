using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ANEO_Banking.Models;

namespace ANEO_Banking.Controllers
{
    public class HomeController : Controller
    {

        Entities _db;

        public HomeController()
        {
            _db = new Entities();

        }
        
        public ActionResult Index()
        {
            var altceva = _db.PACKS.ToList();
            Console.Write(altceva);
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}