function changeVisible(){
  const v = document.getElementById("info-hidden");
  if(v.style.visibility=="visible"){
    // hiddenで非表示
    v.style.visibility ="hidden";
  }else{
    // visibleで表示
    v.style.visibility ="visible";
  }
}
