<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="dpFlex mb10">
	<div class="w15p">
		<button class="h40 w100p fs14 pl10 boc220 bosSolid bow1 bacWhite On3" id="projectStateBtn">
		<span class="w80p dpInlineBlock On3 cursorPointer" id="projectStateText">전체 프로젝트</span>
		<i class="fas fa-chevron-down reverse fc120 On3"></i></button>
	</div>
	
	<div id="projectStateSelectBox" class="projectListState dpNone poAbsolute w180 zi2 mt40 On3">
		<ul class="lsNone bacWhite p10 bora5 boc240 bosSolid bow1 On3 taCenter">
			<li value="1">전체 프로젝트</li>
			<li value="2">진행중인 프로젝트</li>
			<li value="3">공개 예정 프로젝트</li>
			<li value="4">종료된 프로젝트</li>
		</ul>
	</div>	
	
	<div class="ml20 w15p">
		<button class="h40 w100p fs14 pl10 boc220 bosSolid bow1 bacWhite On4" id="projectOrderBtn">
		<span class="w80p dpInlineBlock On4 cursorPointer" id="projectOrderText">달성도순</span>
		<i class="fas fa-chevron-down reverse fc120 On4"></i></button>
	</div>
	
	<div id="projectOrderSelectBox" class="projectListState dpNone poAbsolute w180 zi2 mt40 On4">
		<ul class="lsNone bacWhite p10 bora5 boc240 bosSolid bow1 On4 ml200 w180 taCenter">
			<li value="1">달성도순</li>
			<li value="2">최신순</li>
<!-- 						<li>좋아요순</li> -->
		</ul>
	</div>	
	
</div>