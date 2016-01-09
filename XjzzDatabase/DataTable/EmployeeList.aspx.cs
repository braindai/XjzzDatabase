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

        protected void StateCheckedChanged(object sender, EventArgs e)
        {

        }

        // id 参数名应该与控件上设置的 DataKeyNames 值匹配
        public void GridViewEmployees_DeleteItem(int id)
        {
            var _db = new XjzzDatabase.Models.XjzzDbEntities();
            var employee = _db.Employees.Find(id);
            if (employee.State != 0)
            {
                Response.Write("<script>alert('不能删除状态为有效的用户，请先更改状态!')</script>");
                return;
            }
            _db.Employees.Remove(employee);
            _db.SaveChanges();
        }

        // 返回类型可以更改为 IEnumerable，但是为了支持
        // 分页和排序，必须添加以下参数:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<XjzzDatabase.Models.Employee> GridViewEmployees_GetData()
        {
            var _db = new XjzzDatabase.Models.XjzzDbEntities();
            IQueryable<Employee> query = _db.Employees.OrderBy(c=>c.FullName);
            return query;
        }
    }
}