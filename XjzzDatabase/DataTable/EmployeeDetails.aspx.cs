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
            if (!IsPostBack)
            {
            //inital list
            string htmString="\r\n";
            foreach (var item in SiteDictionary.SexList)
            {
                htmString += "<li><a href=\"#\" onclick=\"ListToTextBox(this,'" + sexTextBox.ClientID + "')\">" + item.Text + "</a></li>\r\n";
            }
            sexList.InnerHtml = htmString;

            htmString = "\r\n";
            foreach (var item in SiteDictionary.ProfList)
            {
                htmString += "<li><a href=\"#\" onclick=\"ListToTextBox(this,'"+profTextBox.ClientID+"')\">"+item.Text+"</a></li>\r\n";
            }
            profList.InnerHtml = htmString;

            htmString = "\r\n";
            foreach (var item in SiteDictionary.DeptList)
            {
                htmString += "<li><a href=\"#\" onclick=\"ListToTextBox(this,'"+deptTextBox.ClientID+"')\">"+item.Text+"</a></li>\r\n";
            }
            deptList.InnerHtml = htmString;

            htmString = "\r\n";
            foreach (var item in SiteDictionary.EmployeeTypeList)
            {
                htmString += "<li><a href=\"#\" onclick=\"ListToTextBox(this,'" + typeTextBox.ClientID + "')\">" + item.Text + "</a></li>\r\n";
            }
            typeList.InnerHtml = htmString;

            htmString = "\r\n";
            foreach (var item in SiteDictionary.EducationList)
            {
                htmString += "<li><a href=\"#\" onclick=\"ListToTextBox(this,'" + educationTextBox.ClientID + "')\">" + item.Text + "</a></li>\r\n";
            }
            educationList.InnerHtml = htmString;
            ViewState["Id"] = "0";
            ViewState["cacheEmployeePictureName"] = "";
            ViewState["lastEmployeePictureName"] ="";

                string strId = Request.QueryString["employeeID"];
                if (string.IsNullOrEmpty(strId))
                {
                    Button_Save.Text = "保存新纪录";
                    SetPageEmployee(null);
                }
                else
                {
                    try
                    {
                        using (var _db = new XjzzDbEntities())
                        {
                            Employee employee;
                            int id = Convert.ToInt32(strId);
                            employee = _db.Employees.Where(c => c.Id == id).FirstOrDefault();
                            if (employee == null)
                            {
                                ErrorMessage.Text = "不存在对应记录";
                                Button_Save.Enabled = false;
                            }
                            else
                            {
                                ViewState["Id"] = employee.Id.ToString();
                                SetPageEmployee(employee);
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

        private void SetPageEmployee(XjzzDatabase.Models.Employee employee)
        {
            if (employee == null)
            {
                EmployeeFullNameLabel.Text = "新职工";
                sexTextBox.Value = "男";
                BirthdayTextBox.Text = System.DateTime.Now.ToString("yyyy-MM-dd");
                DateWhenInTextBox.Text = System.DateTime.Now.ToString("yyyy-MM-dd");
            }
            else
            {
                EmployeeFullNameLabel.Text = employee.FullName;
                FamilyNameTextBox.Text = employee.FamilyName;
                FirstNameTextBox.Text = employee.FirstName;
                sexTextBox.Value = employee.Sex;
                profTextBox.Value = employee.ProfTitle;
                deptTextBox.Value = employee.Dept;
                LabTextBox.Text = employee.Lab;
                GroupTextBox.Text = employee.Group;
                typeTextBox.Value = employee.Types;
                educationTextBox.Value = employee.Education;
                PositionTextBox.Text = employee.Position;
                if (!string.IsNullOrEmpty(employee.PicPath))
                {
                    ImageEmployee.ImageUrl = "~/Data/Images/Employee/" + employee.PicPath;
                    ViewState["lastEmployeePictureName"] = employee.PicPath;
                }                

                OfficePositonTextBox.Text = employee.OfficePositon;
                OfficePhoneTextBox.Text = employee.OfficePhone;
                EmailTextBox.Text = employee.Email;
                MobilePhoneTextBox.Text = employee.MobilePhone;
                QQTextBox.Text = employee.QQ;
                WeiXinTextBox.Text = employee.WeiXin;
                EmergencyPersonTextBox.Text = employee.EmergencyPerson;
                EmergencyPhoneTextBox.Text = employee.EmergencyPhone;

                EnglishFamilyNameTextBox.Text = employee.EnglishFamilyName;
                EnglishFirstNameTextBox.Text = employee.EnglishFirstName;
                OtherNamesTextBox.Text = employee.OtherNames;
                BirthdayTextBox.Text = employee.Birthday.ToString("yyyy-MM-dd");
                NationalityTextBox.Text = employee.Nationality;
                NationTextBox.Text = employee.Nation;
                NativePlaceTextBox.Text = employee.NativePlace;
                IdNumbersTextBox.Text = employee.IdNumbers;
                DateWhenInTextBox.Text = employee.DateWhenIn.ToString("yyyy-MM-dd");
            }
        }

        private Employee GetPageEmployee()
        {
            Employee employee = new Employee();

            employee.Id = Convert.ToInt32(ViewState["Id"].ToString());
            employee.CreateDate = System.DateTime.Now;
            employee.FamilyName = FamilyNameTextBox.Text;
            employee.FirstName = FirstNameTextBox.Text;
            employee.FullName = employee.FamilyName + employee.FirstName; // if english name should add space.
            employee.Sex = sexTextBox.Value;
            employee.ProfTitle = profTextBox.Value;
            employee.Dept = deptTextBox.Value;
            employee.Lab = LabTextBox.Text;
            employee.Group = GroupTextBox.Text;
            employee.Types = typeTextBox.Value;
            employee.Education = educationTextBox.Value;
            employee.Position = PositionTextBox.Text;

            employee.OfficePositon = OfficePositonTextBox.Text;
            employee.OfficePhone = OfficePhoneTextBox.Text;
            employee.Email = EmailTextBox.Text;
            employee.MobilePhone = MobilePhoneTextBox.Text;
            employee.QQ = QQTextBox.Text;
            employee.WeiXin = WeiXinTextBox.Text;
            employee.EmergencyPerson = EmergencyPersonTextBox.Text;
            employee.EmergencyPhone = EmergencyPhoneTextBox.Text;

            employee.EnglishFamilyName = EnglishFamilyNameTextBox.Text;
            employee.EnglishFirstName = EnglishFirstNameTextBox.Text;
            employee.OtherNames = OtherNamesTextBox.Text;
            employee.Birthday = Convert.ToDateTime(BirthdayTextBox.Text);
            employee.Nationality = NationalityTextBox.Text;
            employee.Nation = NationTextBox.Text;
            employee.NativePlace = NativePlaceTextBox.Text;
            employee.IdNumbers = IdNumbersTextBox.Text;
            employee.DateWhenIn = Convert.ToDateTime(DateWhenInTextBox.Text);

            string cacheEmployeePictureName = ViewState["cacheEmployeePictureName"].ToString();
            if (!string.IsNullOrEmpty(cacheEmployeePictureName))
            {
                employee.PicPath = cacheEmployeePictureName;
            }
            else
            {
                employee.PicPath = ViewState["lastEmployeePictureName"].ToString();
            }
            return employee;
        }


        protected void Button_FileUpload_Click(object sender, EventArgs e)
        {
            Boolean fileOK = false;
            String fileExtension = "";
            String path = Server.MapPath("~/Data/Cache/");
            ErrorMessage.Text = "";
            if (PicFileUpload.HasFile)
            {
                fileExtension = System.IO.Path.GetExtension(PicFileUpload.FileName).ToLower();
                String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        fileOK = true;
                    }
                }
                if (fileOK)
                {
                    if (PicFileUpload.PostedFile.ContentLength > 1024 * 200)
                    {
                        ErrorMessage.Text = "图像文件太大";
                        fileOK = false;
                    }
                }
                else
                {
                    ErrorMessage.Text = "图像格式未满足要求";
                }
            }
            if (fileOK)
            {
                try
                {
                    string cacheFileName = Guid.NewGuid().ToString("N");
                    PicFileUpload.PostedFile.SaveAs(path + cacheFileName + fileExtension);
                    ViewState["cacheEmployeePictureName"] = cacheFileName + fileExtension;
                    ImageEmployee.ImageUrl = "~/Data/Cache/" + cacheFileName + fileExtension;
                }
                catch (Exception ex)
                {
                    ErrorMessage.Text = ex.Message;
                }
            }
            
        }

        protected void Button_Save_Click(object sender, EventArgs e)
        {
            Employee employee = GetPageEmployee();
            if(string.IsNullOrEmpty(employee.FamilyName.Trim())||string.IsNullOrEmpty(employee.FirstName.Trim()))
            {
                Response.Write("<script>alert('姓和名不能为空')</script>");
                return;
            }
            using (var _db = new XjzzDbEntities())
            {
                if (employee.Id == 0)
                {
                    _db.Employees.Add(employee);
                }
                else
                {
                    _db.Employees.Attach(employee);
                    var entry = _db.Entry(employee);
                    entry.State = System.Data.Entity.EntityState.Modified;
                    entry.Property(c => c.LoginUserName).IsModified = false;
                    entry.Property(c => c.State).IsModified = false;
                }
                try
                {
                    _db.SaveChanges();
                    string cacheEmployeePictureName = ViewState["cacheEmployeePictureName"].ToString();
                    if (!string.IsNullOrEmpty(cacheEmployeePictureName))
                    {
                        try
                        {
                            System.IO.File.Copy(Server.MapPath("~/Data/Cache/") + cacheEmployeePictureName,
                                Server.MapPath("~/Data/Images/Employee/") + cacheEmployeePictureName, true);
                            System.IO.File.Delete(Server.MapPath("~/Data/Images/Employee/") + ViewState["lastEmployeePictureName"].ToString());
                        }
                        catch (Exception)
                        { }
                    }
                    Response.Redirect("~/DataTable/EmployeeDetails?employeeId=" + employee.Id);
                }
                catch (Exception ex)
                {
                    ErrorMessage.Text = ex.Message;
                }
            }
            
        }
    }
}