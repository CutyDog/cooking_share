<template>
  <div class="container">
    <div class="row" style="padding:30px;">
      <form class="col s12">
        <div class="row">
          <div class="input-field col s12">
            <input id="title" type="text" class="validate">
            <label for="title">title</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s12">
            <input id="description" type="text" class="validate">
            <label for="description">Add description</label>
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
        <div class="col s12 offset-s4">
        <button class="btn waves-effect waves-light " type="submit" name="action">Submit
          <i class="material-icons right">send</i>
        </button>  
        </div>
      </form>
    </div>
  </div>  
</template>