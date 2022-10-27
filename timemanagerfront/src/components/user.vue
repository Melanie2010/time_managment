<template>
  <div>
      <h1>User list</h1>
  </div>
</template>

<script>
import axios from 'axios';
export default {
name: 'UserList',
mounted() {
  axios.get('http://localhost:4000/api/users')
  .then((res) => {
      console.warn(res);
  })
}
}
</script>