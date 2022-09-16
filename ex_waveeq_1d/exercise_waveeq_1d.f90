! -------------------------------------------------------------------
! Exercise: one-dimensional wave equation with a constant phase speed c
! Version: v0.1, 2020/08
!
! 1D wave equation with respect to ϕ:
!   ∂^2ϕ/∂t^2 - c*∂^2ϕ/∂x^2 = 0
!   where x: space, t: time, c: celerity (phase speed/velocity).
!
! License: MIT
! Author: Takuya Miyashita (miyashita@hydrocoast.jp)
!         Disaster Prevention Research Institute, Kyoto University
! -------------------------------------------------------------------
program exercise_wave1d
    implicit none

! --- constant
!    real(kind=8), parameter :: pi = 3.14159265d0
!    real(kind=8), parameter :: g = 9.8d0
    real(kind=8), parameter :: c = 1.0d0

! --- variables
!     -- output
    integer :: fid_out = 11
    integer :: nout = 101, nskip
    real(kind=8) :: dtout
    real(kind=8), allocatable :: tout(:)
    character(len=128) :: fname_out = './wave1d_output.dat'
    character(len=64) :: fmt1, fmt2
!     -- simulation
    integer :: i,j ! loop counters
    integer :: nx, nt
    real(kind=8) :: dx, dt
    real(kind=8) :: lambda
    real(kind=8) :: xmin, xmax, tstart, tend
    real(kind=8), allocatable :: x(:), t(:), eta(:,:)
!     -- boundary condition
    integer :: id_bc
    real(kind=8) :: coef_bc = 0.0

! --- spatial parameters
    xmin = -10.0d0
    xmax = 10.0d0
    dx = 0.02d0
    nx = nint((xmax - xmin)/dx) + 1

! --- temporal parameters
    tstart = 0.0d0
    tend = 20.0d0
    dt = 2.5d-3
    nt = nint((tend - tstart)/dt) + 1
    if (nt < nout) goto 96

! --- boundary condition
!   -- 1: open, 2: wall (close), 3: periodic
    if (iargc()>0) then
        call getarg(1,fmt1)
        read(fmt1,'(I1)') id_bc
    else
        id_bc = 1 ! 1: open
    endif
    if (id_bc < 1 .or. 3 < id_bc ) goto 95

! --- allocation
    allocate(x(nx), t(nt), eta(0:nx+1,0:nt))

! --- generate sequential numbers x and t
    x = (/ (xmin + dx*(i-1), i=1,nx) /)
    t = (/ (tstart + dt*(i-1), i=1,nt) /)
!   check arrays
!    write(*,'(1pe12.5)') (x(i), i=1,nx)
!    write(*,'(1pe12.5)') (t(i), i=1,nt)

! --- output parameters
    allocate(tout(nout))
    if (mod(nt-1,nout-1) /= 0) goto 97
    nskip = nint(dble(nt-1)/dble(nout-1))
    dtout = dt*dble(nskip)
    tout =  (/ (tstart + dtout*(i-1), i=1,nout) /)

! --- initial condition set
!!!! 6.2, 2) set your favorite initial shape.
    eta(1:nx,1) = exp(-5*(x(:)-2.0d0)**2)
!!!!
    do i = 1,nx
        if (abs(eta(i,1)) <= epsilon(eta(i,1))) eta(i,1) = 0.0d0
    enddo
    eta(0,1) = eta(1,1)     ! left margin
    eta(nx+1,1) = eta(nx,1) ! right margin
    eta(:,0) = eta(:,1)     ! eta(x,t(j-1)) = eta(x,t(j)) for j = 1
!   check initial surface
!    write(*,'(1pe12.5)') (eta(:,1), i=0,nx+1)

! --- integration
    lambda = c*dt/dx
    do j = 1,nt-1
        do i = 1,nx
            ! --- main 
            eta(i,j+1) = !!! Please write the appropriate code here. !!!
            ! --- error checker
            if (eta(i,j+1) /= eta(i,j+1)) goto 98
            ! --- tolerance
            if (abs(eta(i,j+1)) <= epsilon(eta(i,j+1))) eta(i,j+1) = 0.0d0
        enddo

        ! --- boundary condition applied ->
        select case (id_bc)
        case (1)
            ! === radiation (open) boundary condition
            coef_bc = (1-lambda**(-1.0d0))/(1+lambda**(-1.0d0))
            eta(0,j+1) = eta(1,j) + coef_bc*(eta(1,j+1)-eta(0,j))
            eta(nx+1,j+1) = eta(nx,j) + coef_bc*(eta(nx,j+1)-eta(nx+1,j))
        case (2)
            ! === wall (closed) boundary condition
            eta(0,j+1) = 0.0d0
            eta(nx+1,j+1) = 0.0d0
        case (3)
            ! === periodic boundary condition
            eta(0,j+1) = eta(nx,j+1)
            eta(nx+1,j+1) = eta(1,j+1)
        endselect
    enddo

! --- output format set
    write(fmt1,'(I0)') nout
    fmt1 = '("# output t =",'//trim(fmt1)//'(f7.2,1x))'
    write(fmt2,'(I0)') nout+1
    fmt2 = '('//trim(fmt2)//'(1pe12.4,1x))'

! --- print
    open(unit=fid_out, file=trim(fname_out), status='replace', action='write', err=99)
    write(fid_out,'(A,I0,A,I0,A,1pe11.4,A,1pe11.4)') &
    &     "# nx = ",nx, ", nt = ", nt, ", dx = ", dx, ", dt = ", dt
    write(fid_out,'(A,I0)') "# x, t0, t1, t2, ..., t", nout-1
    write(fid_out,fmt1) (tout(i),i=1,nout)
    write(fid_out,fmt2) (x(i),(eta(i,j), j=1,nt,nskip), i=1,nx) 
    close(fid_out)

! --- deallocate
    deallocate(x,t,eta,tout)

! --- main rountine end
    return

! --- exceptions and error messages
 95 write(*,'(A,I0)') "Boundary condition parameter must be within 1 to 3. id_bc = ", id_bc
    return
! --- exceptions and error messages
 96 write(*,'(A,I0,A,I0)') 'nout ',nout, " must be equal to or smaller than nt ", nt
    return
! --- exceptions and error messages
 97 write(*,'(A,I0,A,I0)') 'nout must be a number divisible by nt. nt = ',nt, ", nout = ", nout
    return
! --- exceptions and error messages
 98 print *, 'detect NaN: i =',i, ", j =", j 
    write(*,'(4(1pe12.4,2x))') eta(i,j), eta(i+1,j), eta(i-1,j), eta(i,j-1)
    return
! --- exceptions and error messages
 99 print *, 'Failed to open a file to output'
    return

end program exercise_wave1d