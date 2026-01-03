<script lang="ts">
  import { Alert } from "$lib";
  let alertStatus = $state(true);
  const closeAlert = () => {
    alert("Clicked closeAlert.");
    alertStatus = !alertStatus;
  };
</script>

<Alert dismissable onclick={closeAlert} bind:alertStatus>Close me</Alert>
