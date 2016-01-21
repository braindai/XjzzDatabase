/**
		 * 移除项目人员，需要记录Id 
		 * @param tblid
		 * @param radioname
		 * @param tmpIndex
		 * @param blnMsg
		 * @return
		 */

function setNumberLen(value, Length) {
    var value = value + "";
    var str = value;
    for (var i = 1; i < Length; i++) {
        if (value.length <= i)
            str = '0' + str;
    }
    return str;
}

		function removePrjAuthor(tblid,radioname,tmpIndex,blnMsg)
		{
			if(!tmpIndex)
			{
				tmpIndex = 1;
			}else{
				tmpIndex = parseInt(tmpIndex);
			}
			var tr = getSelectedRow(tblid,radioname);
			if(tr==null){
				var msg = $.fn.formateMsg(pubEnterTable.selectRecord);
				$.scmtips.show("warn",msg);
			}
			if(tr != null)
			{
				var num = setNumberLen(tr.rowIndex-tmpIndex ,2);
				var pmId = $("#"+"_prj_members_prj_member_"+num+"_pm_id").attr("value");
				
				deleteSelectedRow(tblid,radioname,tmpIndex,blnMsg);
				if(pmId && $.trim(pmId) != "")
				{
					var removeId = $.trim($("#_prj_members_remove_pms").attr("value"));
					if(removeId != "")
					{
						removeId = removeId + "," + $.trim(pmId);
						$("#_prj_members_remove_pms").attr("value",removeId);
					}else{
						$("#_prj_members_remove_pms").attr("value",$.trim(pmId));
					}
				}
			}
			
		}
		
		/**
		 *移除成果人员，需要记录Id 
		 * @param tblid
		 * @param radioname
		 * @param tmpIndex
		 * @param blnMsg
		 * @return
		 */
		function removePubAuthor(tblid,radioname,tmpIndex,blnMsg)
		{
			if(!tmpIndex)
			{
				tmpIndex = 1;
			}else{
				tmpIndex = parseInt(tmpIndex);
			}
			var tr = getSelectedRow(tblid,radioname);
			if(tr==null){
				var msg = $.fn.formateMsg(pubEnterTable.selectRecord);
				$.scmtips.show("warn",msg);
				return false;
			}

			if(tr != null)
			{
				var num = setNumberLen(tr.rowIndex-tmpIndex ,2);
				var pmId = $("#"+"_pub_members_pub_member_"+num+"_pm_id").attr("value");
				
				deleteSelectedRow(tblid,radioname,tmpIndex,blnMsg);
				if(pmId && $.trim(pmId) != "")
				{
					var removeId = $.trim($("#_pub_members_remove_pms").attr("value"));
					if(removeId != "")
					{
						removeId = removeId + "," + $.trim(pmId);
						$("#_pub_members_remove_pms").attr("value",removeId);
					}else{
						$("#_pub_members_remove_pms").attr("value",$.trim(pmId));
					}
				}
			}
			
		}
		
		/**
		 * 单位项目录入添加人员
		 * @param tblid
		 * @param radioname
		 * @param tmpIndex
		 * @param url
		 * @return
		 */
		function addRolPrjAuthor(tblid,radioname,tmpIndex,url){
			
			addNewRowDeal(tblid,radioname,-1,tmpIndex);
			var tr = $("#"+tblid+">tbody>tr:last");
			var insinput = $(tr).find(":text.author_ins_name_input")[0];
			var acnameinput = $(tr).find(":text.member_psn_acname_input")[0];
			
			ProjectEnter.AutoComplete.authorInsSetup(insinput,"authorInstitution");
			ProjectEnter.AutoComplete.rolAuthorPsnSetup(acnameinput);
		}
		
		/**
		 * 单位成果录入添加人员
		 * @param tblid
		 * @param radioname
		 * @param tmpIndex
		 * @param url
		 * @return
		 */
		function addRolPubAuthor(tblid,radioname,tmpIndex,url){
			
			addNewRowDeal(tblid,radioname,-1,tmpIndex);
			var tr = $("#"+tblid+">tbody>tr:last");
			var insinput = $(tr).find(":text.author_ins_name_input")[0];
			var acnameinput = $(tr).find(":text.member_psn_acname_input")[0];
			
			ScholarEnter.AutoComplete.authorInsSetup(insinput,"authorInstitution");
			ScholarEnter.AutoComplete.rolAuthorPsnSetup(acnameinput);
		}
		
		/**
		 * 个人成果录入添加人员
		 * @param tblid
		 * @param radioname
		 * @param tmpIndex
		 * @param url
		 * @return
		 */
		function addPubAuthor(tblid,radioname,tmpIndex,url){
			
			addNewRowDeal(tblid,radioname,-1,tmpIndex);
//			var tr = $("#"+tblid+">tbody>tr:last");
//			var insinput = $(tr).find(":text.author_ins_name_input")[0];			
//			ScholarEnter.AutoComplete.authorInsSetup(insinput,"psnIns");
		}
		
		/**
		 * 个人项目录入添加人员
		 * @param tblid
		 * @param radioname
		 * @param tmpIndex
		 * @param url
		 * @return
		 */
		function addPrjAuthor(tblid,radioname,tmpIndex,url){
			
			addNewRowDeal(tblid,radioname,-1,tmpIndex);
			var tr = $("#"+tblid+">tbody>tr:last");
			var insinput = $(tr).find(":text.author_ins_name_input")[0];
			ProjectEnter.AutoComplete.authorInsSetup(insinput,"psnIns");
		}
		
		/**
		 * 添加新列
		 * @param tblid 表格的Id
		 * @param radioname 选择的单选名称
		 * @param tmpIndex  模板序号 0开始
		 * @param url 打开的URL添加
		 * @return
		 */
		function addNewRow(tblid,radioname,tmpIndex,url)
		{
			if(url && url!="")
				window.showModalDialog(url,window,'dialogWidth:650px;dialogHeight:320px;status:no;help:no;');
			else {
				addNewRowDeal(tblid,radioname,-1,tmpIndex);
			}

		}
		
		/**
		 * 添加新列
		 * @param tblid 表格的Id
		 * @param radioname 选择的单选名称
		 * @param nNewRowPosition 新位置
		 * @param tmpIndex  模板序号 0开始
		 * @return
		 */
		function addNewRowDeal(tblid,radioname,nNewRowPosition,tmpIndex)
		{
			if(!tmpIndex)
			{
				tmpIndex = 1;
			}else{
				tmpIndex = parseInt(tmpIndex);
			}
			
			var trs = $("#"+tblid+">tbody>tr");
			//alert(trs.length);
			if(trs.length <= tmpIndex)
				return false;
			
			if(!nNewRowPosition || nNewRowPosition==-1 || nNewRowPosition > trs.length)
				 nNewRowPosition = trs.length;
			//alert(nNewRowPosition);
			
			//复制模板
			var newTr = $(trs[tmpIndex]).clone();
			newTr.attr("class","");
			
			//复制的模板插入
			$(trs[nNewRowPosition - 1]).after($(newTr));
			
			//处理模板特殊字符与排序
			reDealRow(tblid,tmpIndex,nNewRowPosition);
		}
		
		/**
		 * 向上移动
		 * @param tblid  表格的Id
		 * @param radioname 选择的单选名称
		 * @param tmpIndex 模板序号 0开始
		 * @return
		 */
		function movePrev(tblid,radioname,tmpIndex)
		{
			if(!tmpIndex){
				tmpIndex = 1;
			}else{
				tmpIndex = parseInt(tmpIndex);
			}
			var nNewRowPosition=getNewRowPosition(tblid,radioname,-1,tmpIndex);
			if(nNewRowPosition == -2){
				return;
			}else if (nNewRowPosition== -1) 
			{
				var msg = $.fn.formateMsg(pubEnterTable.selectRecord);
				$.scmtips.show("warn",msg);
				return false;
			}
			if (nNewRowPosition<=tmpIndex) return false;
			var position = nNewRowPosition + 1;
			switchTr(tblid,tmpIndex,nNewRowPosition,position,radioname,true);
		}
		
		/**
		 * 向下移动
		 * @param tblid 表格的Id
		 * @param radioname 选择的单选名称
		 * @return
		 */
		function moveNext(tblid,radioname,tmpIndex)
		{
			var nNewRowPosition=getNewRowPosition(tblid,radioname,1,tmpIndex);
			if(nNewRowPosition == -2){
				return;
			}else if (nNewRowPosition==-1) 
			{
				var msg = $.fn.formateMsg(pubEnterTable.selectRecord);
				$.scmtips.show("warn",msg);
				return false;
			}
			var startRowIndex = nNewRowPosition - 1;
			switchTr(tblid,tmpIndex,startRowIndex,nNewRowPosition,radioname,false);
		}
		
		/**
		 * 交换两个行的位置
		 * @param tblid 表格的Id
		 * @param index1 
		 * @param index2
		 * @return
		 */
		function switchTr(tblid,tmpIndex,index1,index2,radioname,isMoveUp)
		{
			if(index1 > index2)
			{
				var tmp = index1;
				index1 = index2;
				index2 = tmp;
			}
			
			var trs = $("#"+tblid+">tbody>tr");
			if((trs.length > 0) && (index1 < trs.length) && (index2 < trs.length) && (index1 != index2))
			{
				$(trs[index2]).after($(trs[index1]));
				if(!isMoveUp)
				{
					$(trs[index1]).find(":radio[name='"+radioname+"']").attr("checked",true);
				}
				reDealRow(tblid,tmpIndex,index1,index2);
				return true;
			}
			return false;
			
		}
		
		/**
		 * 获取新位置
		 * @param tblid 表格的Id
		 * @param radioname 选择的单选名称
		 * @param relatedOffsetRow 移位相对位置
		 * @param tmpIndex 模板序号 0开始
		 * @return
		 */
		function getNewRowPosition(tblid,radioname,relatedOffsetRow,tmpIndex)
		{
			var tr =getSelectedRow(tblid,radioname,true);
			if(tr == null)
			{
				return -1;
			}
			if(!tmpIndex){
				tmpIndex = 1;
			}else{
				tmpIndex = parseInt(tmpIndex);
			}
			var trs = $("#"+tblid+">tbody>tr");
			var position = ($(tr)[0].rowIndex+relatedOffsetRow);
			//如果有选项，但是位置到底或到顶了
			if(relatedOffsetRow < 0 && position == tmpIndex)
			{
				return -2;
			}else if(relatedOffsetRow < 0 && position == trs.length){
				return -2;
			}
			return position;
		}
		
	
		
		/**
		 * 删除指定行，并重新排序
		 * @param tblid 表格的Id
		 * @param radioname 选择的单选名称
		 * @param tmpIndex 模板序号 0开始
		 * @param blnMsg 提示信息
		 * @return
		 */
		function removeAttachRow(tblid,radioname,tmpIndex,blnMsg)
		{
			var tr=getSelectedRow(tblid,radioname,true);
			if(tr==null){
				var msg = $.fn.formateMsg(pubEnterTable.selectRecord);
				$.scmtips.show("warn",msg);
			}
			deleteSelectedRow(tblid,radioname,tmpIndex,blnMsg)
		}
		/**
		 * 删除指定行，并重新排序
		 * @param tblid 表格的Id
		 * @param radioname 选择的单选名称
		 * @param tmpIndex 模板序号 0开始
		 * @param blnMsg 提示信息
		 * @return
		 */
		function deleteSelectedRow(tblid,radioname,tmpIndex,blnMsg)
		{
			var index = deleteSelectedRowDo(tblid,radioname,blnMsg);
			if(index)
			{
				reDealRow(tblid,tmpIndex,index);
			}
		}
		
		/**
		 * 删除指定行
		 * @param tblid表格的Id
		 * @param radioname选择的单选名称
		 * @param blnMsg 提示信息
		 * @return
		 */
		function deleteSelectedRowDo(tblid,radioname,blnMsg)
		{
			var tr = getSelectedRow(tblid,radioname);
			if(tr)
			{
				if(blnMsg && !confirm(blnMsg))
				{
					return null;
				}
				var index = $(tr)[0].rowIndex;
				$(tr).remove();
				return index;
			}else{
				var msg = $.fn.formateMsg(pubEnterTable.selectRecord);
				$.scmtips.show("warn",msg);
			}
			return null;
		}
		
		/**
		 * 获取选择的行
		 * @param tblid tblid表格的Id
		 * @param radioname 选择的单选名称
		 * @return
		 */
		function getSelectedRow(tblid,radioname)
		{
			var selectedRadio = $("#" + tblid + " :radio[name='"+radioname+"']:checked")[0];
			if(selectedRadio)
			{
				var tr = $(selectedRadio).parent().parent()[0];
				
				if(tr && $(tr)[0].tagName.toUpperCase() == "TR"){
					return tr;
				}
					
			}
			return null;			
		}
		
		/**
		 * //替换模板字符，同时设置序号，包括重新排[xx]中的顺序
		 * @param tblid 获取选择的行
		 * @param tmpIndex 模板序号 0开始
		 * @param startIndex 开始处理的序号 0开始
		 * @param endIndex 结束处理的序号 0开始，包括该序号
		 * @return
		 */
		function reDealRow(tblid,tmpIndex,startIndex,endIndex)
		{
			var strId = "";
			var strName = "";
			var strAttr = "";
			if(!tmpIndex){
				tmpIndex = 1;
			}else{
				tmpIndex = parseInt(tmpIndex);
			}
			$("#"+tblid+">tbody> tr").each(function(i){
				if(i >= startIndex)
				{
					if(endIndex && i > endIndex)
						return;
					
					var allObj = $(this).find("*").each(function(){
						
						var num = setNumberLen(i-tmpIndex ,2);
						strName = $(this).attr("name");
						if(strName)
						{
							strName = strName.replace(":","@");
							var atIndex = strName.indexOf("@");
							if(atIndex >= 0)
					   		{
						   		strName = strName.replace(/\[\d*\]\/\@/g,"["+ num +"]\/@");
						   		//重新定位
						   		atIndex = strName.indexOf("@");
						   		var strAttr = strName.substring(atIndex+1,strName.length);
						   		$(this).attr("name",strName);
						   	}
						   	else
						   		strAttr = strName;
							
							//alert(strAttr);
							if(strAttr=="sequence_no" || strAttr=="seq_no")
					   		{
								//alert(strAttr);
								setEnterTagValue(this,i-tmpIndex);
					   		}
							//alert($(this).attr("name"));
						}
						
						strId =  $(this).attr("id");
						if(strId)
					    {
							strAttr = strId.replace(":","@");
							strAttr = strAttr.replace(/\[\d*\]\/\@/g,"["+ num +"]\/@");
							strAttr = strAttr.replace(/_\d+_/g,"_"+ num +"_");
							strAttr = strAttr.replace(/[\@\/\[\]]/g,"_");
							strAttr = strAttr.replace(/[_]+/g,"_");
							 $(this).attr("id",strAttr);
							 //alert($(this).attr("id"));
					    }
					});
					
				}
				
			});
		}
		
		/**
		 * //设置元素的值
		 * @param obj
		 * @param value
		 * @return
		 */
		function setEnterTagValue(obj,value)
		{
			if(isSpanTag(obj))
			{
				$(obj).html(value);
				//alert($(obj).html());
			}else{
				
				if($(obj).attr("value"))
				{
					$(obj).attr("value",value);
				}
			}
		}
		
		/**
		 * 是否是span
		 * @param obj
		 * @return
		 */
		function isSpanTag(obj)
		{
			//alert(obj);
			var tagName = $(obj)[0].tagName;
			if(tagName && tagName.toUpperCase() == "SPAN")
				return true;
			return false;
		}
		
		
		
