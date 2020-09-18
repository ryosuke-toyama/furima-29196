if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const clickUpload = document.getElementById('click-upload');

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div')
      imageElement.setAttribute('id', "image-element")
      let imageElementNum = document.querySelectorAll('#image-element').length
      const blobImage = document.createElement('img')
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('style', 'width: 150px;');
      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('id', `item_image_${imageElementNum}`)
      inputHTML.setAttribute('name', 'item_tag[images][]')
      inputHTML.setAttribute('type', 'file')
      clickUpload.appendChild(imageElement);
      imageElement.appendChild(blobImage);
      imageElement.appendChild(inputHTML)

      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      })
      
    };

    document.getElementById('item-image').addEventListener('change',function(e){
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      
      createImageHTML(blob);
      
    });
  });
}