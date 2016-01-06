//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace XjzzDatabase.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Paper
    {
        public Paper()
        {
            this.Title = "无标题";
        }
    
        public int PaperId { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public string AuthorFull { get; set; }
        public string Source { get; set; }
        public string PublishDate { get; set; }
        public string PublishYear { get; set; }
        public string Volume { get; set; }
        public string Issue { get; set; }
        public string BeginPage { get; set; }
        public string EndPage { get; set; }
        public string Doi { get; set; }
        public string AccessionNumber { get; set; }
        public string IndexType { get; set; }
        public string PaperType { get; set; }
        public string ImpactFactorType { get; set; }
        public Nullable<double> ImpactFactor { get; set; }
        public string Remarks { get; set; }
        public string Funding { get; set; }
        public string IDSNumber { get; set; }
        public string Language { get; set; }
        public string Abstract { get; set; }
        public int Verified { get; set; }
        public int Locked { get; set; }
    }
}
