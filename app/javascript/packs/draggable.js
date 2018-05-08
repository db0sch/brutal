import { Sortable } from '@shopify/draggable';

const sortable = new Sortable(document.querySelectorAll('ol'), {
  draggable: 'li'
});


const persistPosition = (event) => {
  const id = event.dragEvent.data.source.dataset.itemId
  const position = event.data.newIndex + 1
  const token = getCSRFToken()
  console.log(id)
  console.log(token)
  // { id, position } = {event}
  fetch(`/items/positions/${id}`, {
    method: "PATCH",
    credentials: 'same-origin',
    headers: {
      "Content-Type": "application/json",
      "X-CSRF-Token": token
    },
    body: JSON.stringify({ position: position })
  })
    .then(response => response.json())
    .then((data) => {
      console.log(data); // Look at local_names.default
  });
}

const getCSRFToken = () => {
  const token = document.querySelector('meta[name="csrf-token"]').content;
  return token
}

console.log(sortable)

sortable.on('sortable:start', () => console.log('sortable:start'));
sortable.on('sortable:sort', () => console.log('sortable:sort'));
sortable.on('sortable:stop', (e) => persistPosition(e));
