<template>
  <div>
    <ul id="dropdown1" class="dropdown-content">
      <li><router-link to="/">Top</router-link></li>
      <li><router-link to="/post"><i class="material-icons">create</i></router-link></li>
      <li><router-link to="/mypage"><i class="material-icons">person_outline</i></router-link></li>
      <li><router-link to="/search"><i class="material-icons">search</i></router-link></li>
    </ul>
    <nav>
      <div class="nav-wrapper container">
        <a href="/" class="brand-logo left">CookingShare</a>
        <ul class="right hide-on-med-and-down">
          <li><router-link to="/">Top</router-link></li>
          <li><router-link to="/post"><i class="material-icons">create</i></router-link></li>
          <li><router-link to="/mypage"><i class="material-icons">person_outline</i></router-link></li>
          <li><router-link to="/search"><i class="material-icons">search</i></router-link></li>
        </ul>
        
        <ul class="right hide-on-large-only">
          <li>
            <a class="dropdown-trriger" href="#!" data-target="dropdown1">
              <i class="material-icons right">menu</i>
            </a>
          </li>
        </ul>
      </div>
    </nav>
  </div>
</template>

