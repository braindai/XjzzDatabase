using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using XjzzDatabase.Models;

namespace XjzzDatabase.DataTable
{
    public partial class PaperDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //inital list
                //string htmString = "\r\n";
                //foreach (var item in SiteDictionary.SexList)
                //{
                //    htmString += "<li><a href=\"#\" onclick=\"ListToTextBox(this,'" + sexTextBox.ClientID + "')\">" + item.Text + "</a></li>\r\n";
                //}
                //sexList.InnerHtml = htmString;

                ViewState["Id"] = "0";

                string strId = Request.QueryString["paperID"];
                if (string.IsNullOrEmpty(strId))
                {
                    Button_Save.Text = "保存新纪录";
                    SetPagePaper(null);
                }
                else
                {
                    try
                    {
                        using (var _db = new XjzzDbEntities())
                        {
                            Paper paper;
                            int id = Convert.ToInt32(strId);
                            paper = _db.Papers.Where(c => c.Id == id).FirstOrDefault();
                            if (paper == null)
                            {
                                ErrorMessage.Text = "不存在对应记录";
                                Button_Save.Enabled = false;
                            }
                            else
                            {
                                ViewState["Id"] = paper.Id.ToString();
                                SetPagePaper(paper);
                                if (paper.Locked != 0)
                                {
                                    Button_Save.Enabled = false;
                                    Button_Save.Text = "记录锁定";
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        ErrorMessage.Text = ex.Message;
                    }
                }
            }
        }
        private void SetPagePaper(XjzzDatabase.Models.Paper paper)
        {
            if (paper == null)
            {
                TitleLabel.Text = "新论文";
            }
            else
            {
                TitleLabel.Text = paper.Title;

                TitleTextBox.Text = paper.Title;
                AuthorTextBox.Text = paper.Author;
                SourceTextBox.Text = paper.Source;
                if (paper.PublishDate.HasValue)
                {
                    PublishYearTextBox.Text = paper.PublishDate.Value.ToString("yyyy");
                    PublishMonthTextBox.Text = paper.PublishDate.Value.ToString("MM");
                }
                else
                {
                    PublishYearTextBox.Text = "";
                    PublishMonthTextBox.Text = "";
                }               
                
                VolumeTextBox.Text = paper.Volume;
                IssueTextBox.Text = paper.Issue;
                StartPageTextBox.Text = paper.BeginPage;
                EndPageTextBox.Text = paper.EndPage;
               
                AccessionNumberTextBox.Text = paper.AccessionNumber;
                DOITextBox.Text = paper.Doi;
                Checkbox_EI.Checked = Convert.ToBoolean(paper.EI);
                Checkbox_SCIE.Checked = Convert.ToBoolean(paper.SCIE);
                Checkbox_SSCI.Checked = Convert.ToBoolean(paper.SSCI);
                Checkbox_ISTP.Checked = Convert.ToBoolean(paper.ISTP);
                Checkbox_Core.Checked = Convert.ToBoolean(paper.ChineseCore);

          //      IndexTypeTextBox.Text = paper.IndexType;
                PaperTypeTextBox.Text = paper.PaperType;
                IFTypeTextBox.Text = paper.ImpactFactorType;
                IFTextBox.Text = paper.ImpactFactor.ToString();                
                
                AuthorFullTextBox.Text = paper.AuthorFull;
                RemarksTextBox.Text = paper.Remarks;
                LanguageTextBox.Text = paper.Language;
                FundingTextBox.Text = paper.Funding;
                AbstractTextArea.Value = paper.Abstract;
            }
        }
        private XjzzDatabase.Models.Paper GetPagepaper()
        {
            Paper paper = new Paper();

            paper.Id = Convert.ToInt32(ViewState["Id"].ToString());
            paper.CreateDate = System.DateTime.Now;
            paper.Title = TitleTextBox.Text ;
            paper.Source = SourceTextBox.Text;

            if(!string.IsNullOrEmpty(PublishYearTextBox.Text)&&!string.IsNullOrEmpty(PublishMonthTextBox.Text))
            {
                int year = Convert.ToInt32(PublishYearTextBox.Text);
                int month = Convert.ToInt32(PublishMonthTextBox.Text);
                paper.PublishDate = new DateTime(year, month, 1);
            }

            paper.Volume = VolumeTextBox.Text;
            paper.Issue=IssueTextBox.Text ;
            paper.BeginPage=StartPageTextBox.Text;
            paper.EndPage=EndPageTextBox.Text;
            
            paper.AccessionNumber=AccessionNumberTextBox.Text ;
            paper.Doi=DOITextBox.Text;

    //        paper.IndexType=IndexTypeTextBox.Text;

            paper.EI = Checkbox_EI.Checked?1:0;
            paper.SCIE = Checkbox_SCIE.Checked ? 1 : 0;
            paper.SSCI = Checkbox_SSCI.Checked ? 1 : 0;
            paper.ISTP = Checkbox_ISTP.Checked ? 1 : 0;
            paper.ChineseCore = Checkbox_Core.Checked ? 1 : 0;

            paper.PaperType=PaperTypeTextBox.Text;
            paper.ImpactFactorType= IFTypeTextBox.Text;
            if (string.IsNullOrEmpty(IFTextBox.Text))
                paper.ImpactFactor = null;
            else
                paper.ImpactFactor = Convert.ToDouble(IFTextBox.Text);                
                
            paper.AuthorFull=AuthorFullTextBox.Text;
            paper.Remarks=RemarksTextBox.Text;
            paper.Language= LanguageTextBox.Text;
            paper.Funding=FundingTextBox.Text;
            paper.Abstract=AbstractTextArea.Value;
            return paper;
        }
        protected void Button_Save_Click(object sender, EventArgs e)
        {

            Paper paper = GetPagepaper();
            if(string.IsNullOrEmpty(paper.Title.Trim()))
            {
                Response.Write("<script>alert('标题不能为空')</script>");
                return;
            }
            using (var _db = new XjzzDbEntities())
            {
                if (paper.Id == 0)
                {
                    _db.Papers.Add(paper);
                }
                else
                {
                    _db.Papers.Attach(paper);
                    var entry = _db.Entry(paper);
   //                 entry.State = System.Data.Entity.EntityState.Modified;
                    entry.Property(c => c.CreateDate).IsModified = true;
                    entry.Property(c => c.Title).IsModified = true;
                    entry.Property(c => c.Source).IsModified = true;
                    entry.Property(c => c.PublishDate).IsModified = true;
                    entry.Property(c => c.Volume).IsModified = true;
                    entry.Property(c => c.Issue).IsModified = true;
                    entry.Property(c => c.BeginPage).IsModified = true;
                    entry.Property(c => c.EndPage).IsModified = true;
                    entry.Property(c => c.AccessionNumber).IsModified = true;
                    entry.Property(c => c.Doi).IsModified = true;
                    entry.Property(c => c.EI).IsModified = true;
                    entry.Property(c => c.SCIE).IsModified = true;
                    entry.Property(c => c.SSCI).IsModified = true;
                    entry.Property(c => c.ISTP).IsModified = true;
                    entry.Property(c => c.ChineseCore).IsModified = true;
  //                  entry.Property(c => c.IndexType).IsModified = true;
                    entry.Property(c => c.PaperType).IsModified = true;
                    entry.Property(c => c.ImpactFactorType).IsModified = true;
                    entry.Property(c => c.ImpactFactor).IsModified = true;
                    entry.Property(c => c.AuthorFull).IsModified = true;
                    entry.Property(c => c.Remarks).IsModified = true;
                    entry.Property(c => c.Language).IsModified = true;
                    entry.Property(c => c.Funding).IsModified = true;
                    entry.Property(c => c.Abstract).IsModified = true;
                    entry.Property(c => c.Verified).IsModified = true;
                }
                try
                {
                    _db.SaveChanges();
                   
                    Response.Redirect("~/DataTable/paperDetails?paperId=" + paper.Id);
                }
                catch (Exception ex)
                {
                    ErrorMessage.Text = ex.Message;
                }
            }
            
        }
    }
}