using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace XjzzDatabase.Models
{
    public class SiteDictionary
    {

        public static List<Dict> SexList = new List<Dict>{
            new Dict{
                Id=0,
                Text ="男"},
            new Dict{
                Id =1,
                Text ="女"}                                   
        };
        public static List<Dict> ProfList = new List<Dict>{
                new Dict{
                Id=0,
                Text =""},
                new Dict{
                Id=1,
                Text ="教授"},
                new Dict{
                Id =2,
                Text ="研究员"},
                new Dict{
                Id =3,
                Text ="副教授"},
                new Dict{
                Id =4,
                Text ="副研究员"},  
                 new Dict{
                Id =5,
                Text ="讲师"},
                 new Dict{
                Id =6,
                Text ="助研"},
                new Dict{
                Id =7,
                Text ="高级工程师"},
                new Dict{
                Id =8,
                Text ="工程师"},  
                 new Dict{
                Id =9,
                Text ="其他"}, 
        };
        public static List<Dict> EmployeeTypeList = new List<Dict>{
                new Dict{
                Id=0,
                Text =""},
            new Dict{
                Id=1,
                Text ="教师"},
            new Dict{
                Id =2,
                Text ="博士后"},
                 new Dict{
                Id =3,
                Text ="工程师"},
                 new Dict{
                Id =4,
                Text ="行政"},
                 new Dict{
                 Id =5,
                Text ="自聘人员"}, 
                 new Dict{
                 Id =6,
                Text ="其他"},
        };
        public static List<Dict> DeptList = new List<Dict>{
            new Dict{
                Id=0,
                Text =""},
            new Dict{
                Id=1,
                Text ="先进制造学部"},   
        };
        public static List<Dict> EducationList = new List<Dict>{
                            new Dict{
                Id=0,
                Text =""},
            new Dict{
                Id=1,
                Text ="研究生/博士"}, 
                new Dict{
                Id=2,
                Text ="研究生/硕士"}, 
                new Dict{
                Id=3,
                Text ="本科"},  
                new Dict{
                Id=4,
                Text ="其他"},  
        };

    }
    /// <summary>
    /// 字典
    /// </summary>
    public class Dict
    {
        public int Id { set; get; }
        public string Text { set; get; }
    }
}