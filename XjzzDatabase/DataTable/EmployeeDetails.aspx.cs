using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using XjzzDatabase.Models;

namespace XjzzDatabase.DataTable
{
    public partial class EmployeeDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        // id 参数应与控件上设置的 DataKeyNames 值匹配
        // 或用值提供程序特性装饰，例如 [QueryString]int id
        public XjzzDatabase.Models.Employee FormViewEmployee_GetItem([QueryString("employeeID")]int? id)
        {
            if (id.HasValue && id > 0)
            {
                var _db = new XjzzDbEntities();
                return _db.Employees.Where(c => c.Id == id).First();
            }
            else
                return null;
        }

        // id 参数名应该与控件上设置的 DataKeyNames 值匹配
        public void FormViewEmployee_UpdateItem(int id)
        {
            XjzzDatabase.Models.Employee item = null;
            // 在此加载该项，例如 item = MyDataLayer.Find(id);
            if (item == null)
            {
                // 未找到该项
                ModelState.AddModelError("", String.Format("未找到 id 为 {0} 的项", id));
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // 在此保存更改，例如 MyDataLayer.SaveChanges();

            }
        }

        // id 参数名应该与控件上设置的 DataKeyNames 值匹配
        public void FormViewEmployee_DeleteItem(int id)
        {

        }

        protected void Button_EnterSelect_Click(object sender, EventArgs e)
        {
            FormViewEmployee.ChangeMode(FormViewMode.ReadOnly);
        }

        protected void Button_EnterEdit_Click(object sender, EventArgs e)
        {
            FormViewEmployee.ChangeMode(FormViewMode.Edit);
        }

        protected void Button_EnterDelete_Click(object sender, EventArgs e)
        {

        }
    }
}