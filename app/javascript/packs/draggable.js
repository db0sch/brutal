import { Sortable } from '@shopify/draggable';

const sortable = new Sortable(document.querySelectorAll('ol'), {
  draggable: 'li'
});

console.log(sortable)

sortable.on('sortable:start', () => console.log('sortable:start'));
sortable.on('sortable:sort', () => console.log('sortable:sort'));
sortable.on('sortable:sorted', (e) => console.log(e));
sortable.on('sortable:stop', () => console.log('sortable:stop'));
