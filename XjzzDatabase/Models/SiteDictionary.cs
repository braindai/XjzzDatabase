using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace XjzzDatabase.Models
{
    public class SiteDictionary
    {

        public static List<DictSex> SexList = new List<DictSex>{
            new DictSex{
                Id=0,
                Text ="男"},
            new DictSex{
                Id =1,
                Text ="女"}                                   
        };
    }
    public class DictSex
        {
            public int Id{set;get;}
            public string Text { set; get; }
        }
}