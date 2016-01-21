using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

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
                Radio_J.Checked = true;
                Radio_C.Checked = false;
                Radio_Unknow.Checked = true;
                Radio_Chinease.Checked = false;
                Radio_Foreign.Checked = false;
            }
            else
            {
                TitleLabel.Text = paper.Title;

                TitleTextBox.Text = paper.Title;                
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

                if (paper.PaperType==0)
                {
                    Radio_J.Checked = true;
                    Radio_C.Checked = false;
                }
                else
                {
                    Radio_J.Checked = false;
                    Radio_C.Checked = true;
                }

                IFTypeTextBox.Text = paper.ImpactFactorType;
                IFTextBox.Text = paper.ImpactFactor.ToString();


                authorListString.Value = paper.AuthorFull;


                if (paper.IsForeign == 1)
                {
                    Radio_Unknow.Checked = false;
                    Radio_Chinease.Checked = true;
                    Radio_Foreign.Checked = false;
                }
                else if (paper.IsForeign == 2)
                {
                    Radio_Unknow.Checked = false;
                    Radio_Chinease.Checked = false;
                    Radio_Foreign.Checked = true;
                }
                else {
                    Radio_Unknow.Checked = true;
                    Radio_Chinease.Checked = false;
                    Radio_Foreign.Checked = false;
                }
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
            paper.Issue=IssueTextBox.Text;
            paper.BeginPage=StartPageTextBox.Text;
            paper.EndPage=EndPageTextBox.Text;

            paper.EI = Checkbox_EI.Checked ? 1 : 0;
            paper.SCIE = Checkbox_SCIE.Checked ? 1 : 0;
            paper.SSCI = Checkbox_SSCI.Checked ? 1 : 0;
            paper.ISTP = Checkbox_ISTP.Checked ? 1 : 0;
            paper.ChineseCore = Checkbox_Core.Checked ? 1 : 0;
            paper.PaperType = Radio_J.Checked ? 0 : 1;

            paper.AccessionNumber=AccessionNumberTextBox.Text;
            paper.Doi=DOITextBox.Text;
            paper.Abstract = AbstractTextArea.Value;
            paper.Remarks = RemarksTextBox.Text;  

            paper.AuthorFull = authorListString.Value;

            paper.ImpactFactorType= IFTypeTextBox.Text;
            if (string.IsNullOrEmpty(IFTextBox.Text))
                paper.ImpactFactor = null;
            else
                paper.ImpactFactor = Convert.ToDouble(IFTextBox.Text);
            if (Radio_Chinease.Checked)
                paper.IsForeign = 1;
            else if (Radio_Foreign.Checked)
                paper.IsForeign = 2;
            else
                paper.IsForeign = 0;

            
            paper.Funding=FundingTextBox.Text;
            paper.Language = LanguageTextBox.Text;
            
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
                    entry.State = System.Data.Entity.EntityState.Modified;
                    entry.Property(c => c.Locked).IsModified = false;
                    entry.Property(c => c.Verified).IsModified = false;
                    entry.Property(c => c.Author).IsModified = false;
                    entry.Property(c => c.State).IsModified = false;
                    entry.Property(c => c.FileId).IsModified = false;
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