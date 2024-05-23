!This code uses Newton Raphson method to check for roots (both real and complex). 
!This code works only if the function is continuous and differentiable. The function automatically terminates if a constant function is detected after deflation.
!You can uncomment any one function or add a new function, provided it is continuous.

program newton_raphson_check
   implicit none
   complex*16::x=(-5,-5),y
   complex*16,allocatable::r(:)
   integer::s,n=10,i,count=0
   allocate(r(n))
   r=0.d0
   do i=1,n
      call nr(x,r,count,y,s)
      if (s.eq.1) then
         exit
      end if
      r(i)=y
      count=count+1
      print *,y,count
   end do
end program

FUNCTION F(X,r,count) RESULT(Y)
   COMPLEX*16, intent(in) :: X,r(100)
   COMPLEX*16 :: Y,pi
   integer::i,count
   !Y=2*(x**3)+9*x*x+13*x+6
   !Y=5*(x**3)+9*x*x+13*x+6
   !y=(x-2)*(x-3)
   !y=x**4+3
   PI=1
   DO I=1,count
      IF (R(I).NE.(0,0)) THEN
         PI=PI*(X-r(i))
      ELSE;EXIT
      END IF
   END DO
   Y=Y/PI
END FUNCTION F

subroutine nr(x,r,count,xn,s)
   complex*16,intent(in)::x,r(100)
   complex*16::xo,xn,y1,f
   integer::s,count

   xo=x
   do i=1,1000
      call dydx(xo,r,count,y1)
      s=0
      if (abs(real(y1)).le.1e-10) then
         s=1
         exit
      end if

      xn=xo-(f(xo,r,count)/y1)

      if (abs(x-xin).le.10e-7) then
         exit
      end if

      xo=xn
   end do
end subroutine nr

subroutine dydx(x,r,count,y1)
   complex*16,intent(in)::x,r(100)
   complex*16::y1,h,a(20),t(20,20)=0.d0,f
   integer::i,count
   h=1e-3;y1=1

   !Five point formula
   do i=1,20
      a(i)=(1.0/(12*h))*(f((x-(2*h)),r,count)-(8*f((x-h),r,count))+(8*(f((x+h),r,count)))-f((x+(2*h)),r,count))
      h=h*0.5
   end do

   !Richardson's extrapolation
   do i=1,20
      t(i,1)=a(i)
   end do


   do i=2,20
      do j=2,i-1
         t(i,j)=t(i,j-1)+(t(i,j-1)-t(i-1,j-1))/((2**(j*2))-1)
      end do
   end do

   y1 = t(20,19)
end subroutine dydx

