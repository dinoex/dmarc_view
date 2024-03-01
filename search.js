// search.js
// version 2024-02

function mytablefilter(tab, searchTerm){
	var tab2 = tab.cloneNode(true);
	var nodes = tab2.getElementsByTagName("tr");
	for(var i = 1; i<nodes.length; i = i+1){
		var node = nodes[i];

		if(node.innerText.toLowerCase().match(searchTerm) || searchTerm==""){
			if(node.style.display!=""){
				node.style.display = "";
			}
		}else{
			if(node.style.display==""){
				node.style.display = "none";
			}
		}
	};
	tab.replaceWith(tab2);
	return tab2;
}

function mysearch(){
	const searchTerm = document.getElementById("search").value.toLowerCase();
	const filterTable = document.querySelectorAll("table");
	for (let i = 0; i < filterTable.length; i++){
		filterTable[i] = mytablefilter(filterTable[i], searchTerm);
	}
	if(searchTerm==""){
		reset.disabled = true;
	}else{
		reset.disabled = false;
	}
	search.focus();
}

function myreset(){
	search.value='';
	mysearch();
}

function mystart(){
	mysearch();
}

// eof
