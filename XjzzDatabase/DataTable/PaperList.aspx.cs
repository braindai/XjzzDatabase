using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XjzzDatabase.DataTable
{
    public partial class PaperList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {

            if (String.IsNullOrEmpty(this.TextBoxTitle.Text))
                return;
            var _db = new XjzzDatabase.Models.XjzzDbEntities();
            var query = _db.Employees.Where(c => c.FullName.Contains(this.TextBoxTitle.Text)).Select(c => new { c.Id, c.FullName, c.Sex });
            this.GridViewPapers.DataSource = query.ToList();
            this.GridViewPapers.DataBind();
        }
    }
}