using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using XjzzDatabase.Models;
using System.Web.UI.HtmlControls;

namespace XjzzDatabase.DataTable
{
    public partial class PaperImport : System.Web.UI.Page
    {
        protected class _ResultPaper{
            public int Id { set; get; }
            public string Title { set; get; }
            public string Result { set; get; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button_FileUpload_Click(object sender, EventArgs e)
        {
            ErrorMessage.Text = "";
            ResultMessage.Text = "";
            //Boolean fileOK = false;
            if (typeList.Value == "0")
            {
                ErrorMessage.Text = "请先选定类型";
                return;
            }

            String fileExtension = "";
            String path = Server.MapPath("~/Data/Cache/");
           
            if (!FileUpload.HasFile)
            {
                ErrorMessage.Text = "请先选择文件";
                return;
            }
            if (FileUpload.PostedFile.ContentLength > 1024 * 2048)
            {
                ErrorMessage.Text = "文件太大(>2M)";
                return;
            }
            try
            {
                fileExtension = System.IO.Path.GetExtension(FileUpload.FileName).ToLower();
                string cacheFileName = Guid.NewGuid().ToString("N");
                FileUpload.PostedFile.SaveAs(path + cacheFileName + fileExtension);
                if (typeList.Value == "1")
                {
                    Import_WOK_PlainText(cacheFileName + fileExtension);
                }
              }
            catch (Exception ex)
            {
                ErrorMessage.Text = ex.Message;
            }
        }

        protected void Import_WOK_PlainText(string fileName)
        {
            String path = Server.MapPath("~/Data/Cache/");

            StreamReader sr = new StreamReader(path + fileName, System.Text.Encoding.Default);
            String line;
            List<Paper> paperList = new List<Paper>();
            string lastHeader = "";
            Paper curPaper = null;
            while ((line = sr.ReadLine()) != null)
            {
                if (line.Count() < 3)
                    continue;
                string header = line.Substring(0, 2);
                switch (header)
                {
                    case "PT":
                        if (curPaper != null)
                        {
                            paperList.Add(curPaper);
                        }
                        curPaper = new Paper();
                        lastHeader = "PT";
                        break;
                    case "AU":
                        curPaper.AuthorFull = line.Substring(3).Trim();
                        lastHeader = "AU";
                        break;
                    case "TI":
                        curPaper.Title = line.Substring(3).Trim();
                        lastHeader = "TI";
                        break;
                    case "SO":
                        curPaper.Source = line.Substring(3).Trim();
                        lastHeader = "SO";
                        break;
                    case "VL":
                        curPaper.Volume = line.Substring(3).Trim();
                        lastHeader = "VL";
                        break;
                    case "IS":
                        curPaper.Issue = line.Substring(3).Trim();
                        lastHeader = "IS";
                        break;
                    case "BP":
                        curPaper.BeginPage = line.Substring(3).Trim();
                        lastHeader = "BP";
                        break;
                    case "EP":
                        curPaper.EndPage = line.Substring(3).Trim();
                        lastHeader = "EP";
                        break;
                    case "DI":
                        curPaper.Doi = line.Substring(3).Trim();
                        lastHeader = "DI";
                        break;
                    case "PD":
                        try
                        {
                            curPaper.PublishDate = Convert.ToDateTime(line.Substring(3).Trim());
                        }
                        catch (Exception)
                        {
                            curPaper.PublishDate = null;
                        }
                        lastHeader = "PD";
                        break;
                    case "AB":
                        curPaper.Abstract = line.Substring(3).Trim();
                        lastHeader = "AB";
                        break;
                    case "UT":
                        curPaper.AccessionNumber = line.Substring(3).Trim();
                        lastHeader = "UT";
                        break;

                    case "  ":
                        switch (lastHeader)
                        {
                            case "AU":
                                curPaper.AuthorFull += ";";
                                curPaper.AuthorFull += line.Substring(3).Trim();
                                break;
                            case "TI":
                                curPaper.Title += " ";
                                curPaper.Title += line.Substring(3).Trim();
                                break;
                            case "SO":
                                curPaper.Source += " ";
                                curPaper.Source += line.Substring(3).Trim();
                                break;
                            case "AB":
                                curPaper.Abstract += " ";
                                curPaper.Abstract += line.Substring(3).Trim();
                                break;
                            default:
                                break;
                        }
                        break;
                    default:
                        lastHeader = "";
                        break;
                }
            }
            if (curPaper != null)
                paperList.Add(curPaper);


           if (indexTypeList.Value == "SCIE")
            {
                foreach (Paper item in paperList)
                {
                    item.SCIE = 1;
                }
            }
           else if (indexTypeList.Value == "EI")
            {
                foreach (Paper item in paperList)
                {
                    item.EI = 1;
                }
            }
           else if (indexTypeList.Value == "SSCI")
            {
                foreach (Paper item in paperList)
                {
                    item.SSCI = 1;
                }
            }
           else if (indexTypeList.Value == "ISTP")
           {
               foreach (Paper item in paperList)
               {
                   item.ISTP = 1;
               }
           }
           else if (indexTypeList.Value == "CORE")
           {
               foreach (Paper item in paperList)
               {
                   item.ChineseCore = 1;
               }
           }


            int addedCount=0;
            int index = 0;
            List<_ResultPaper> resultList = new List<_ResultPaper>();
            using (var _db = new XjzzDbEntities())
            {
                foreach (Paper item in paperList)
                {
                    _ResultPaper result = new _ResultPaper();
                    result.Id = index;
                    result.Title = item.Title;
                    var nums = _db.Papers.Where(c => c.Title == item.Title).Count();
                    if (nums != 0)
                    {
                        result.Result = "失败：已存在同名文档";
                    }
                    else
                    {
                        try
                        {
                            item.CreateDate = System.DateTime.Now;
                            _db.Papers.Add(item);
                            _db.SaveChanges();
                            addedCount++;
                            result.Result = "添加成功";
                        }
                        catch (Exception ex)
                        {

                            result.Result = "失败:" + ex.Message;
                        }
                    }
                    resultList.Add(result);
                    index++;
                }
            }
            ResultMessage.Text = string.Format("添加结果：共发现{0}条记录，添加成功{1}条，失败{2}条",index,addedCount,index-addedCount);
            GridViewResult.DataSource = resultList;
            GridViewResult.DataBind();       
        
        }        
    }
}