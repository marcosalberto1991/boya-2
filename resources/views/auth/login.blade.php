@extends('layouts.app_mosnter')
@section('content')


<style type="text/css">
.login-page{
  background-image: url("images/login.jpg");
  swidth: 200px;
  background-color: #cccccc;

}  

</style>
<div class="login-box">
 <div class="login-box-body">
    <p class="login-box-msg">Iniciar Sesión</p>
    <form method="POST" action="{{ route('login') }}">
         
           
           {{ csrf_field() }}

      <div class="form-group has-feedback">
        <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required autofocus>
        <!--
        <input type="email" class="form-control" placeholder="Email">
        -->
         @if ($errors->has('email'))
            <span class="invalid-feedback">
                <strong>{{ $errors->first('email') }}</strong>
            </span>
        @endif
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
<!--
        <input type="password" class="form-control" placeholder="Password">
-->
        <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required>
        @if ($errors->has('password'))
            <span class="invalid-feedback">
                <strong>{{ $errors->first('password') }}</strong>
            </span>
        @endif
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-md-8">
          <div class="checkbox icheck">
            <label>
                <!--
                <input type="checkbox"> Remember Me
                -->
              <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}> Recuérdame
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-md-4">
            <!--
          <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
        -->
            <button type="submit" class="btn btn-primary btn-block btn-flat">
                Entrar   
            </button>
        </div>
        <!-- /.col -->
      </div>
    </form>
<!--
    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
        Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
        Google+</a>
    </div>
    -->
    <!-- /.social-auth-links -->

    <a  href="{{ route('password.request') }}">
    ¿Olvidaste la contraseña de tu cuenta?
    </a><br>    
    <!--
    <a href="register" class="text-center">Regístrate</a>
    -->
  </div>
</div>




@endsection
