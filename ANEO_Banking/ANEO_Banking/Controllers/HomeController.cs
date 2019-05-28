using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ANEO_Banking.Models;

namespace ANEO_Banking.Controllers
{

    
    [Route("")]
    public class HomeController : Controller
    {


        Entities _db;

        public class UserCredentials
        {
            public string cardNumber { get; set; }
            public string cvv { get; set; }
        }



        public HomeController()
        {
            _db = new Entities();

        }

        public ActionResult Index()
        {
            if (Session["UserCardNumber"] != null)
            {
                string cardNo = Session["UserCardNumber"].ToString();
                decimal id_cust = _db.CUSTOMER_CREDIT_CARDS.Where(c => c.CARD_NUMBER == cardNo).FirstOrDefault().ID;
                string prenume = _db.CUSTOMERS.Where(i => i.ID == id_cust).FirstOrDefault().PRENUME;


                string account_number = _db.CUSTOMER_CREDIT_CARDS.Where(c => c.CARD_NUMBER == cardNo).FirstOrDefault().ACCOUNT_NUMBER;
                decimal balance = (decimal)_db.ACCOUNTS.Where(a => a.ACCOUNT_NUMBER == account_number).FirstOrDefault().BALANCE;

                ViewBag.Message = "Hello " + prenume + "! Balance: " + balance.ToString();
                return View();
            }
            else
            {
                return RedirectToAction("Login");
            }

            
        }
        
        public ActionResult PACKS()
        {
            ViewBag.Message = "Packs";

            return View();
        }

        public ActionResult TR_HIST()
        {

            string cardNo = Session["UserCardNumber"].ToString();
            
            decimal id_cust = _db.CUSTOMER_CREDIT_CARDS.Where(c => c.CARD_NUMBER == cardNo).FirstOrDefault().ID;
            string prenume = _db.CUSTOMERS.Where(i => i.ID == id_cust).FirstOrDefault().PRENUME;
            

            string account_number = _db.CUSTOMER_CREDIT_CARDS.Where(c => c.CARD_NUMBER == cardNo).FirstOrDefault().ACCOUNT_NUMBER;
            //decimal balance = (decimal) _db.ACCOUNTS.Where(a => a.ACCOUNT_NUMBER == account_number).FirstOrDefault().BALANCE;
            //ViewBag.Message = "Hello " + prenume + "! Balance: " + balance.ToString();
            List<decimal> ids = _db.TRANSACTIONS.Where(a => a.ACC_NO_CUSTOMER1 == account_number || a.ACC_NO_CUSTOMER2 == account_number).Select(a => a.ID).ToList();
            List<ANEO_Banking.Models.TRANSACTIONS_HISTORY> transaction_details = _db.TRANSACTIONS_HISTORY.Where(i => ids.Contains(i.ID_TRANSACTION)).OrderByDescending(i => i.CREATED_AT) .Select(x => x).ToList();
            ViewBag.Data = transaction_details;

            return View();
        }
        
            public ActionResult Login()
            {
                return View();
            }

            [HttpPost]
            [ValidateAntiForgeryToken]
            public ActionResult Login(CREDIT_CARDS objUser)
            {
                if (ModelState.IsValid)
                {
                    using (_db )
                    {
                        var obj = _db.CREDIT_CARDS.Where(a => a.CARD_NUMBER.Equals(objUser.CARD_NUMBER) && a.CVV.Equals(objUser.CVV)).FirstOrDefault();
                        if (obj != null)
                        {
                            Session["UserCardNumber"] = obj.CARD_NUMBER.ToString();
                            Session["UserCVV"] = obj.CVV.ToString();
                            return RedirectToAction("Index");
                        }
                    }
                }
                return View(objUser);
            }

            
        
    }
}