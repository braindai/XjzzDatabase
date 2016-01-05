using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using XjzzDatabase.Models;

namespace XjzzDatabase.DataTable
{
    public partial class Employees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public IQueryable<Employee> GetEmployee() 
        {
            var _db = new XjzzDatabase.Models.XjzzDbEntities(); 
            IQueryable<Employee> query = _db.Employees;
            return query;
        }
    }
}