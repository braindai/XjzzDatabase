using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XjzzDatabase.DataTable
{
    public class PaperQueryList{
        public int Id{set;get;}
        public string Title { set; get; }
        public int Verified { set; get; }
        public int Locked { set; get; }
    }
    public partial class PaperList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            GridViewPapers.DataBind();
            //var _db = new XjzzDatabase.Models.XjzzDbEntities();
            //if (String.IsNullOrEmpty(this.TitleTextBox.Text))
            //{
            //    var query = _db.Papers.Select(c => new { c.Id, c.Title, c.Verified, c.Locked });
            //    int nums = 0;
            //    if (query != null)
            //        nums = query.Count();
            //    LabelResultNums.Text = string.Format("数目:{0}", nums);
            //    this.GridViewPapers.DataSource = query.ToList();
            //    this.GridViewPapers.DataBind();
            //}
            //else {
            //    var query = _db.Papers.Where(c => c.Title.Contains(this.TitleTextBox.Text)).Select(c => new { c.Id, c.Title, c.Verified, c.Locked });
            //    int nums = 0;
            //    if (query != null)
            //        nums = query.Count();
            //    LabelResultNums.Text = string.Format("数目:{0}", nums);
            //    this.GridViewPapers.DataSource = query.ToList();
            //    this.GridViewPapers.DataBind();            
            //}
        }

        protected void VerifiedCheckedChanged(object sender, EventArgs e)
        {
            CheckBox chk = (CheckBox)sender;
            int index = ((GridViewRow)(chk.NamingContainer)).RowIndex;
            int id = Int32.Parse(GridViewPapers.DataKeys[index].Value.ToString());
            var _db = new XjzzDatabase.Models.XjzzDbEntities();
            XjzzDatabase.Models.Paper paper = _db.Papers.Find(id);
            if (paper != null)
            {
                if (chk.Checked == true)
                {
                    paper.Verified = 1;
                }
                else
                {
                    paper.Verified = 0;
                }
                _db.SaveChanges();
            }
        }


        protected void LockedCheckedChanged(object sender, EventArgs e)
        {

            CheckBox chk = (CheckBox)sender;
            int index = ((GridViewRow)(chk.NamingContainer)).RowIndex;
            int id = Int32.Parse(GridViewPapers.DataKeys[index].Value.ToString());
            var _db = new XjzzDatabase.Models.XjzzDbEntities();
            XjzzDatabase.Models.Paper paper = _db.Papers.Find(id);
            if (paper != null)
            {
                if (chk.Checked == true)
                {
                    paper.Locked = 1;
                }
                else
                {
                    paper.Locked = 0;
                }
                _db.SaveChanges();
            }
        }

        // id 参数名应该与控件上设置的 DataKeyNames 值匹配
        public void GridViewPapers_DeleteItem(int id)
        {
            var _db = new XjzzDatabase.Models.XjzzDbEntities();
            var paper = _db.Papers.Find(id);
            if (paper.Locked != 0)
            {
                Response.Write("<script>alert('不能删除锁定的论文，请先更改状态!')</script>");
                return;
            }
            _db.Papers.Remove(paper);
            _db.SaveChanges();
        }

        // 返回类型可以更改为 IEnumerable，但是为了支持
        // 分页和排序，必须添加以下参数:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<XjzzDatabase.DataTable.PaperQueryList> GridViewPapers_GetData()
        {
          if (!IsPostBack)
                return null;
            string queryTitle = this.TitleTextBox.Text;
            if (string.IsNullOrEmpty(queryTitle))
                queryTitle = "";
            var _db = new XjzzDatabase.Models.XjzzDbEntities();
            var query = _db.Papers.Where(c => c.Title.Contains(queryTitle)).Select(c => new PaperQueryList{Id = c.Id, Title =c.Title, Verified=c.Verified, Locked=c.Locked });

            int nums = 0;
            if (query != null)
                nums = query.Count();
            LabelResultNums.Text = string.Format("数目:{0}", nums);
            return query;
        }
    }
}