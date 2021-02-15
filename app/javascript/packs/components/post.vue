<template>
  <div class="row">
    <form class="col s12">
      <div class="row">
        <div class="input-field col s12">
          <input id="last_name" type="text" class="validate">
          <label for="last_name">description</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="password" type="password" class="validate">
          <label for="password">Password</label>
        </div>
      </div>
      <div class="file-field input-field">
        <div class="btn">
          <span>Picture</span>
          <input type="file" multiple>
        </div>
        <div class="file-path-wrapper">
          <input class="file-path validate" type="text" placeholder="Upload one or more files">
        </div>
      </div>    
    </form>
  </div>
</template>