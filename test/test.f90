! -------------------------------------------------------------------
! Test purpose only
! -------------------------------------------------------------------
program test
    implicit none
! --- variables
!     -- output
    integer :: fid_h = 12, fid_inc = 13
!     -- simulation
    integer :: i,j ! loop counters
    integer :: nx, nt
    integer :: nx_flat
    real(kind=8) :: dx, dt
    real(kind=8) :: xmin, xmax, tstart, tend
    real(kind=8) :: xflat
    real(kind=8), parameter :: h0 = 30.0d0          ! depth of flat bottom
    real(kind=8), parameter :: slope = 1.0d0/10.0d0 ! slope of the seafloor
    real(kind=8), parameter :: amp = 0.1d0          ! wave amplitude
    real(kind=8), allocatable :: x(:), t(:)
    real(kind=8), allocatable :: h(:)
    real(kind=8), allocatable :: eta_in(:)

! --- spatial parameters
    xmin = 0.0d0
    xmax = 5.5d2
    dx = 1.0d0
    nx = nint((xmax - xmin)/dx) + 1
    xflat = 3.0d2
    nx_flat = nint((xflat - xmin)/dx) + 1

! --- temporal parameters
    tstart = 0.0d0
    tend = 60.0d0
    dt = 1.0d-2
    nt = nint((tend - tstart)/dt) + 1

! --- allocation
    allocate(x(nx), t(nt))
    allocate(h(nx))
    allocate(eta_in(nt))

! --- generate sequential numbers x and t
    t = (/ (tstart + dt*(j-1), j=1,nt) /)
    x = (/ (xmin + dx*(i-1), i=1,nx) /)
    h(1:nx_flat) = h0
    h(nx_flat+1:nx) = (/ (h0 - (x(i)-xflat)*slope, i=nx_flat+1,nx) /)

    ! --- print depth
    open(unit=fid_h, file='depth_h.dat', status='replace', action='write', err=99)
    write(fid_h,'(2(1pe9.3, 1x))') (x(i), h(i), i=1,nx)
    close(fid_h)

! --- define an incident wave (time-series)
    eta_in = (/ (amp*(dcosh(0.5d0*(t(j)-10.0d0))**(-2.0d0)), j=1,nt) /)
    do j = 1, nt
        if (abs(eta_in(j)) < 1.0d-8)  eta_in(j) = 0.0d0
    enddo
    eta_in(1) = 0.0d0

! --- print the incident wave
    open(unit=fid_inc, file='incident_wave.dat', status='replace', action='write', err=99)
    write(fid_inc,'(2(1pe9.3, 1x))') (t(j), eta_in(j), j=1,nt)
    close(fid_inc)

! --- deallocate
    deallocate(x,t)
    deallocate(h)
    deallocate(eta_in)

! --- main rountine end
    return

! --- exceptions and error messages
 99 print *, 'Failed to open a file to output'
    return

end program test