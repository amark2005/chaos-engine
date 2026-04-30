module engine
  use iso_c_binding
  implicit none
  
contains
function lyapunov(r) bind(c)
  real(c_double), value :: r
  real(c_double) :: lyapunov
  real(8) :: x, sum, d
  integer :: i, count
  x = 0.5d0
  sum = 0.0d0
  count = 0
  do i = 1, 100
    x = r * x * (1.0d0 - x)
  end do
  do i = 1, 1000
    x = r * x * (1.0d0 - x)
    d = r * (1.0d0 - 2.0d0 * x)
    if (d < 0.0d0) d = -d
    if (d < 1.0d-10) cycle
    sum = sum + log(d)
    count = count + 1
  end do
  if (count == 0) then
    lyapunov = -9999.0d0
  else
    lyapunov = sum / count
  end if
end function 
subroutine lorenz_step(x, y, z, sigma, rho, beta, dt) bind(c)
  real(c_double), intent(inout) :: x, y, z
  real(c_double), value         :: sigma, rho, beta, dt
  real(c_double) :: dx, dy, dz
  dx = sigma * (y - x)
  dy = x * (rho - z) - y
  dz = x * y - beta * z
  x = x + dx * dt
  y = y + dy * dt
  z = z + dz * dt
end subroutine
end module engine