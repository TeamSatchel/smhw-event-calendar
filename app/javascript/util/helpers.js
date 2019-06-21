function csrfToken(document) {
  let token = document.querySelector('[name="csrf-token"]');
  if (token){
    return token.content;
  }
}

export function passCsrfToken(document, axios) {
  axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken(document);
}
