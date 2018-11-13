<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>数据爬取</title>

<!-- Le styles -->
<link href="<%=basePath%>bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath%>bootstrap/bootstrap-select.min.css" rel="stylesheet">

	<script type="text/javascript" src="<%=basePath%>bootstrap/jquery-2.0.0.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>bootstrap/bootstrap.js"></script>
<script type="text/javascript" src="<%=basePath%>bootstrap/bootstrap-select.min.js"></script>
<script type="text/javascript" src="<%=basePath%>bootstrap/defaults-zh_CN.min.js"></script>
</head>
<body style="min-height: 589px; padding-top:0px;cursor: auto;" class="devpreview sourcepreview">

    <!--/span-->
    <div style="min-height: 519px;" class="demo ui-sortable"><div class="lyrow ui-draggable" style="display: block;">
              <div class="view">
                <div class="row-fluid clearfix">
                  <div class="span12 column ui-sortable"><div class="box box-element ui-draggable" style="display: block; position: relative; opacity: 1; left: 0px; top: 0px;">
              <div class="view"><div class="page-header" contenteditable="true">
<h1>数据爬取&nbsp;<small>根据您的喜好选择数据源</small></h1>
</div>
</div>
            </div><div class="lyrow ui-draggable" style="display: block;"> 
              <div class="view">
                <div class="row-fluid clearfix">
                  <div style="float:left;width:60%" class="span8 column ui-sortable"><div class="box box-element ui-draggable" style="display: block; position: relative; opacity: 1; left: 0px; top: 0px;"> 
              <div class="view">
                <div class="carousel slide" id="carousel-775521">
                  <ol class="carousel-indicators">
                    <li class="" data-slide-to="0" data-target="#carousel-775521"></li>
                    <li data-slide-to="1" data-target="#carousel-775521" class="active"></li>
                    <li data-slide-to="2" data-target="#carousel-775521" class=""></li>
                  </ol>
                  <div class="carousel-inner">
                    <div class="item"> <img alt="" src="<%=basePath%>images/11.jpg">
                      <div class="carousel-caption" contenteditable="true">
                        <h4>棒球</h4>
                        <p>棒球运动是一种以棒打球为主要特点，集体性、对抗性很强的球类运动项目，在美国、日本尤为盛行。</p>
                      </div>
                    </div>
                    <div class="item active"> <img alt="" src="<%=basePath%>images/22.jpg">
                      <div class="carousel-caption" contenteditable="true">
                        <h4>冲浪</h4>
                        <p>冲浪是以海浪为动力，利用自身的高超技巧和平衡能力，搏击海浪的一项运动。运动员站立在冲浪板上，或利用腹板、跪板、充气的橡皮垫、划艇、皮艇等驾驭海浪的一项水上运动。</p>
                      </div>
                    </div>
                    <div class="item"> <img alt="" src="<%=basePath%>images/33.jpg">
                      <div class="carousel-caption" contenteditable="true">
                        <h4>自行车</h4>
                        <p>以自行车为工具比赛骑行速度的体育运动。1896年第一届奥林匹克运动会上被列为正式比赛项目。环法赛为最著名的世界自行车锦标赛。</p>
                      </div>
                    </div>
                  </div>
                  <a style="padding-top:100px" data-slide="prev" href="http://www.bootcss.com/p/layoutit/#carousel-775521" class="left carousel-control">‹</a> <a style="padding-top:100px" data-slide="next" href="http://www.bootcss.com/p/layoutit/#carousel-775521" class="right carousel-control">›</a> </div>
              </div>
            </div></div>
                  <div style="float:left;width:40%" class="span4 column ui-sortable"><div class="lyrow ui-draggable" style="display: block;"> 
              <div class="view">
                <div class="row-fluid clearfix">
                  <div class="span12 column ui-sortable"><div class="box box-element ui-draggable" style="display: block;"> 
              <div class="view">
               <span class="label">文件类型选择</span>
                <select class="selectpicker" multiple>
                   <optgroup label="年度报表">
                                   <option value="1">文本</option>
                                   <option value="2">表格</option>
                                   <option value="3">图例</option>
                         </optgroup>  
                     <option value="4">政府政策</option>
                     <option value="5">物通网</option>                            
                                    </select>
              </div>
            </div></div>
                </div>
              </div>
            </div><div class="lyrow ui-draggable" style="display: block;"> 
              <div class="view">
                <div class="row-fluid clearfix">
                  <div class="span12 column ui-sortable"><div class="box box-element ui-draggable" style="display: block;"> 
              <div class="view">
                <div class="btn-group">
                 <span class="label">文字标签</span>
                  <button class="btn" contenteditable="true">Action</button>
                  <button data-toggle="dropdown" class="btn dropdown-toggle"><span class="caret"></span></button>
                  <ul class="dropdown-menu" contenteditable="true">
                    <li><a href="http://www.bootcss.com/p/layoutit/#">操作</a></li>
                    <li><a href="http://www.bootcss.com/p/layoutit/#">设置栏目</a></li>
                    <li><a href="http://www.bootcss.com/p/layoutit/#">更多设置</a></li>
                    <li class="divider"></li>
                    <li class="dropdown-submenu"> <a tabindex="-1" href="http://www.bootcss.com/p/layoutit/#">更多选项</a>
                      <ul class="dropdown-menu">
                        <li><a href="http://www.bootcss.com/p/layoutit/#">操作</a></li>
                        <li><a href="http://www.bootcss.com/p/layoutit/#">设置栏目</a></li>
                        <li><a href="http://www.bootcss.com/p/layoutit/#">更多设置</a></li>
                      </ul>
                    </li>
                  </ul>
                </div>
              </div>
            </div></div>
                </div>
              </div>
            </div><div class="lyrow ui-draggable" style="display: block; position: relative; opacity: 1; left: 0px; top: 0px;"> 
              <div class="view">
                <div class="row-fluid clearfix">
                  <div class="span12 column ui-sortable"><div class="box box-element ui-draggable" style="display: block;"> 
              
              <div class="view">
                <button class="btn" type="button" contenteditable="true">按钮</button>
              </div>
            </div></div>
                </div>
              </div>
            </div></div>
                </div>
              </div>
            </div><div class="lyrow ui-draggable" style="display: block; position: relative; opacity: 1; left: 0px; top: 0px;"> 
              <div class="view">
                <div class="row-fluid clearfix">
                  <div class="span12 column ui-sortable"><div class="box box-element ui-draggable" style="display: block; position: relative; opacity: 1; left: 0px; top: 0px;"> 
              <div class="view">
                <div class="progress progress-striped active progress-info">
                  <div class="bar" style="width: 60%;"></div>
                </div>
              </div>
            </div></div>
                </div>
              </div>
            </div></div>
                </div>
              </div>
            </div></div>
  </div>
</div>
</body></html>