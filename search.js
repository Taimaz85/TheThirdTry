const data = [

    { type: "Product" , name: "Bratwurst" , category: "Sausage" , link: "./pages/sausage.html#bratwurst"},
    { type: "Product" , name: "Bierwurst" , category: "Sausage" , link: "./pages/sausage.html#bierwurst"},
    { type: "Product" , name: "Pinkel" , category: "Sausage" , link: "./pages/sausage.html#pinkel" },
    { type: "Product" , name: "Regensburger-wurst" , category: "Sausage" , link: "./pages/sausage.html#regensburger" },
    { type: "Product" , name: "Weisswurst" , category: "Sausage" , link: "./pages/sausage.html#weisswurst" },

    { type: "Product" , name: "Irish Bacon or Rashers" , category: "Bacon" , link: "./pages/bacon.html#irish"},
    { type: "Product" , name: "Lardons" , category: "Bacon" , link: "./pages/bacon.html#lardons"},
    { type: "Product" , name: "Pancetta" , category: "Bacon" , link: "./pages/bacon.html#pancetta"},
    { type: "Product" , name: "Slab" , category: "Bacon" , link: "./pages/bacon.html#slab"},
    { type: "Product" , name: "Speck" , category: "Bacon" , link: "./pages/bacon.html#speck"},
    { type: "Product" , name: "Guanciale" , category: "Bacon" , link: "./pages/bacon.html#guanciale"},
    
    { type: "Product" , name: "Black Froest Ham" , category: "Ham" , link: "./pages/ham.html#black"},
    { type: "Product" , name: "Capicola" , category: "Ham" , link: "./pages/ham.html#capicola"},
    { type: "Product" , name: "Country Ham" , category: "Ham" , link: "./pages/ham.html#country"},
    { type: "Product" , name: "Honey Ham" , category: "Ham" , link: "./pages/ham.html#honey"},
    { type: "Product" , name: "Jamon Iberico" , category: "Ham" , link: "./pages/ham.html#jamon"},
    { type: "Product" , name: "Prosciutto" , category: "Ham" , link: "./pages/ham.html#prosciutto"},
    { type: "Product" , name: "Serrano" , category: "Ham" , link: "./pages/ham.html#serrano"},


];



document.getElementById('search-input').addEventListener('input' , (e) => {
    const filter = e.target.value.toUpperCase();
    const resultsContainer = document.getElementById('search-results');
    resultsContainer.innerHTML = '';  //Clear previous results...

    if (filter) {
        const filteredItems = data.filter(item =>
            item.name.toUpperCase().includes(filter) ||
            (item.category && item.category.toUpperCase().includes(filter))
        );

        if (filteredItems.length > 0) {
            filteredItems.forEach(item => {
                const resultItem = document.createElement('div');
                resultItem.classList.add('result-item');

                const link = document.createElement('a');
                link.href = item.link;
                link.textContent = `${item.name}` + (item.category ? ` (Category: ${item.category})` : '');

                resultItem.appendChild(link);
                resultsContainer.appendChild(resultItem);
            });
        } else {
            resultsContainer.innerHTML = '<p>No results found.</p>';
        }
    }
});