const btn = document.querySelectorAll('main .food_list div .food_poji .poji_title > a')
const txt = document.querySelectorAll('main .food_list > div .food_txt')
const div = document.querySelectorAll('main .food_list div .food_poji')
const xicon = document.querySelectorAll('main .food_list div .food_txt .txt_title > a')
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
