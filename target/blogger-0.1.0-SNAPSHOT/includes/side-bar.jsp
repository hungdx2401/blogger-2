<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="katy.bordercollie.helper.StaticItem"%>
<%@page import="katy.bordercollie.entity.Article"%>
<%@page import="katy.bordercollie.entity.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside class="span4">
	<div id="sidebar">
		<div>
			<img alt="" src="/images/kem-logo.png">
		</div>
		<div class="box">
			<form action="" method="get" onsubmit="location.href='/search/' + encodeURIComponent(this.search.value).replace(/ /g, '+'); return false;" class="form-inline">
				<input type="text" class="input-block-level" name="search" id="s" placeholder="Tìm kiếm">
			</form>
		</div>
		<%
			if(StaticItem.recents!=null&&StaticItem.recents.size()>0){
		%>
		<div class="box postListing">
			<h3 class="boxTitle">Đang được theo dõi</h3>
			<div class="boxContent">
				<ul>
					<%									
						for(int i=StaticItem.recentKeys.size()-1; i>=0;i--){
							Article article = StaticItem.recents.get(StaticItem.recentKeys.get(i));
					%>					
					<li class="row-fluid">
						<div class="span3">
							<a href="/articles?id=<%=article.getId() %>">
								<img class="img-full-width" src="<%=article.getPhotos().size() > 0 ? article.getPhotos().get(0) : "" %>"/>
							</a> 
						</div>
						<div class="span9">
							<a href="/articles?id=<%=article.getId() %>" class="title">
								<%=article.getTitle() %>
							</a> 
							<a class="published" href="/articles?time=<%=article.getDoc()%>"
								title="Date <?=list_recent_view.get(i).getDate()?>">
								<%=article.getFormatedDoc() %>
							</a>
						</div>
					</li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
		<%
			}
		%>
		
		<%
			if(StaticItem.mapCategory!=null&&StaticItem.mapCategory.size()>0){
		%>
		<div class="box categories">
			<h3 class="boxTitle">Danh mục</h3>
			<div class="boxContent">
				<ul class="clearafter">
					<%
						for(Entry<String,Category> entry: StaticItem.mapCategory.entrySet()){
					%>
					<li>
						<a href="/articles?category=<%=entry.getValue().getId()%>">
							<%=entry.getValue().getTitle() %>
						</a>
					</li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
		<%
			}
		%>
		<%-- <div class="box tags">
			<h3 class="boxTitle">Tags</h3>
			<div class="boxContent clearafter">
				<?
										for (var i=0;i<list_tag.size();i++)
										{
											var split =  list_tag.get(i).split(',');
										?>
				<a href="/tag/<?=split[0]?>">
					<?=split[1]?>
				</a>
				<?
										}
									?>

			</div>
		</div> --%>
	</div>
</aside>