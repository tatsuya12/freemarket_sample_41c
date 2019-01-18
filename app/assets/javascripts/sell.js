

//都府県の選択肢
var arr = [
  {cd:"", label:"▼都府県選択"},
  {cd:"13", label:"東京都"},
  {cd:"23", label:"愛知県"},
  {cd:"27", label:"大阪府"}
];
 
//市区の選択肢
var arrTokyo = [
  {cd:"", label:"▼区選択"},
  {cd:"1", label:"新宿区"},
  {cd:"2", label:"千代田区"},
  {cd:"3", label:"中央区"}
];
var arrAichi = [
  {cd:"", label:"▼市選択"},
  {cd:"1", label:"名古屋市"},
  {cd:"2", label:"豊橋市"},
  {cd:"3", label:"岡崎市"},
  {cd:"4", label:"豊田市"},
  {cd:"5", label:"一宮市"}
];
var arrOsaka = [
  {cd:"", label:"▼市選択"},
  {cd:"1", label:"大阪市"},
  {cd:"2", label:"堺市"},
  {cd:"3", label:"東大阪市"},
  {cd:"4", label:"枚方市"},
  {cd:"5", label:"豊中市"},
  {cd:"6", label:"吹田市"},
  {cd:"7", label:"高槻市"}
];
 
//都府県コンボの生成
window.onload=function(){
  for(var i=0;i<arr.length;i++){
    let op = document.createElement("option");
    op.value = arr[i].cd;
    op.text = arr[i].label;
    document.getElementById("selPref").appendChild(op);
  }
}
 
//都府県が選択された時に呼び出される処理
function selPref(obj){
  var targetArr;
  if(obj.value == "13"){
    targetArr = arrTokyo;
  }else if(obj.value == "23"){
    targetArr = arrAichi;
  }else if(obj.value == "27"){
    targetArr = arrOsaka;
  }else{
    targetArr = new Array();
  }
  var selObj = document.getElementById('selCity');
  while(selObj.lastChild){
    selObj.removeChild(selObj.lastChild);
  }
  for(var i=0;i<targetArr.length;i++){
    let op = document.createElement("option");
    op.value = targetArr[i].cd;
    op.text = targetArr[i].label;
    selObj.appendChild(op);
  }
}




$(function(){
    /* selectボックスの選択が変更したら中の処理を実行 */
    $('#select').change(function(){
        /* 選択したselectボックスのvalue値を取得して、変数valに入れる */
        var val = $(this).val();
        /* 変数valの値ごとに、処理をswichでふりわけ */
        switch (val) {
            case '1':
                /* #box1を表示 */
                $('#box1').show();
                /* divのidに「box」を含むid名がついているもので、box1じゃないものは非表示 */
                $('div[id^="box"]:not("#box1")').hide();
            break;
            case '2':
                /* #box2を表示 */
                $('#box2').show();
                /* divのidに「box」を含むid名がついているもので、box2じゃないものは非表示 */
                $('div[id^="box"]:not("#box2")').hide();
            break;
            /* caseで設定した以外の処理 */
            default:
                /* divのidに「box」を含むid名がついているものは非表示 */
                $('div[id^="box"]').hide();
        }
    });
});