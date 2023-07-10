 function saveDropdownValues() {
        var colNameSelect = document.getElementById("colNameSelect");
        var sortTypeSelect = document.getElementById("sortTypeSelect");
        
        var selectedColName = colNameSelect.options[colNameSelect.selectedIndex].value;
        var selectedSortType = sortTypeSelect.options[sortTypeSelect.selectedIndex].value;
        
        sessionStorage.setItem("savedColName", selectedColName);
        sessionStorage.setItem("savedSortType", selectedSortType);
    }
    
    // Khôi phục giá trị dropdown khi tải lại trang
    window.onload = function() {
        var colNameSelect = document.getElementById("colNameSelect");
        var sortTypeSelect = document.getElementById("sortTypeSelect");
        
        var savedColName = sessionStorage.getItem("savedColName");
        var savedSortType = sessionStorage.getItem("savedSortType");
        
        if (savedColName) {
            colNameSelect.value = savedColName;
        }
        
        if (savedSortType) {
            sortTypeSelect.value = savedSortType;
        }
    };