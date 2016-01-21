using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

namespace XjzzDatabase.Models
{
    public class PublishAuthor
    {
        public string Name { set; get; }
        public bool IsFirt { set; get; }
        public bool IsCorresponding { set;get; }
        public string Institution { set; get; }

        public static string MakeAuthorStringFromList(List<PublishAuthor> listAuthor)
        {
            StringBuilder sb = new StringBuilder(100);
            foreach (var item in listAuthor)
            {
                sb.Append(item.Name);
                sb.Append("|");
                sb.Append(item.IsFirt ? "1" : "0");
                sb.Append("|");
                sb.Append(item.IsCorresponding ? "1" : "0");
               sb.Append("|");
                sb.Append(item.Institution);
                sb.Append(";");            
            }
            if (listAuthor.Count() > 0)
            {
                sb.Remove(sb.Length - 1, 1); //remove last ";"
            }        
            return sb.ToString();
        }

        public static string MakeAuthorSimpleStringFromList(List<PublishAuthor> listAuthor)
        {
            StringBuilder sb = new StringBuilder(100);
           foreach (var item in listAuthor)
            {
                sb.Append(item.Name);
                if (item.IsCorresponding)
                    sb.Append("*;");
                else
                    sb.Append(";");
            }
            if (listAuthor.Count() > 0)
            {
                sb.Remove(sb.Length - 1, 1); //remove last ";"
            }
            return sb.ToString();
        }

        public static List<PublishAuthor> MakeAuthorListFromString(string listString)
        {
            List<PublishAuthor> listAuthor = new List<PublishAuthor>();
            if (string.IsNullOrWhiteSpace(listString))
                return listAuthor;
            string[] authors = listString.Split(';');
            foreach (var item in authors)
            {
                if (!string.IsNullOrWhiteSpace(item))
                { 
                    string[] author = item.Split('|');
                    PublishAuthor pubAuthor = new PublishAuthor();
                    pubAuthor.Name = author[0];
                    try {

                        pubAuthor.IsFirt = Convert.ToBoolean(Convert.ToInt32(author[1]));
                        pubAuthor.IsCorresponding = Convert.ToBoolean(Convert.ToInt32(author[2]));
                        pubAuthor.Institution = author[3];                    
                    }
                    catch(Exception)
                    {

                    }
                    if (pubAuthor.Name.IndexOf("*") >= 0)      //Corresponding author
                    {
                        pubAuthor.Name = pubAuthor.Name.Replace("*", "");
                        pubAuthor.IsCorresponding = true;
                    }
                    listAuthor.Add(pubAuthor);
                }
            }
            if (listAuthor.Count() > 0)
                listAuthor[0].IsFirt = true;
            return listAuthor;
        }
    }
}