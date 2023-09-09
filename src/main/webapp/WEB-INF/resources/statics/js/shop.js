const btn = document.querySelectorAll('main .shap_list div .shap_poji .poji_title > a')
const txt = document.querySelectorAll('main .shap_list > div .shap_txt')
const div = document.querySelectorAll('main .shap_list div .shap_poji')
const xicon = document.querySelectorAll('main .shap_list div .shap_txt .txt_title > a')
console.log(btn,txt,div,xicon)
for(let i of txt){i.style.display = 'none'}
div.forEach(function(t,i,a){
    t.addEventListener('click',function(e){
        e.preventDefault()
        console.log(txt)
        txt[i].style.display ='block'
    })
    xicon[i].addEventListener('click',function(e){
        e.preventDefault()
        txt[i].style.display = 'none'
    })
})
