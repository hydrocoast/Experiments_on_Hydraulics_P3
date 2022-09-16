! -------------------------------------------------------------------
! Exercise: wave shoaling (1D, cross-section)
! Version: v0.1, 2020/08
!
! Governing equation: nonlinear shallow water equation
!   ∂M/∂t + u*∂M/∂x = -g*D*∂η/∂x + (friction term) + (diffusion term)
!   where x: space, t: time, M: x-dir flux (=u*D), u: x-dir velocity,
!         g: gravity acceleration, D: total depth (η+h), 
!         η: water surface height from mean sea level, h: depth.
!   The friction and diffusion terms are neglected here.
!
! Continuity equation:
!   ∂η/∂t + ∂M/∂x = ∂S/∂t
!   where S: wave source.
!   S is given only at the boundary x=0 as an incident wave.
!   S=0 for any other areas. 
!
! Notes:
! This code adopts the staggered grid (so called Arakawa C-grid) system.
! Please note that the u-velocity components and fluxes are defined at 
! the left and right grid faces while the depth and water surface height
! are define at the grid center. The following illustrates this grid system:
! === Staggered grid ===
!      -------------------------------------------------------------
!      |         |         |         |         |         |         |
!      x    o    x    o    x    o    x    o    x    o    x    o    x
!      |         |         |         |         |         |         |
!      -------------------------------------------------------------
! i = 1/2   1   3/2   2   5/2   3   ...                n-1/2  n  n+1/2     
!          h(1)      h(2)      h(3)      ...      h(n-1)     h(n)
!     M(1)      M(2)      M(3)      ...                 M(n)     M(n+1)
! Quantities defined at o and x are as follows: 
!     o -> h, η, D, S 
!     x -> u, M
!
! License: MIT
! Author: Takuya Miyashita (miyashita@hydrocoast.jp)
!         Disaster Prevention Research Institute, Kyoto University
! -------------------------------------------------------------------
program exercise_longwave1d
    implicit none

! --- constant
    real(kind=8), parameter :: g = 9.8d0 ! in m/s^2

! --- variables
!     -- output
    integer :: fid_out = 11
    integer :: nout = 121, nskip
    integer :: fid_h = 12, fid_inc = 13
    real(kind=8) :: dtout
    real(kind=8), allocatable :: tout(:)
    character(len=128) :: fname_out = './longwave1d_output.dat'
    character(len=64) :: fmt1, fmt2
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
    real(kind=8), allocatable :: h(:), etamax(:)
    real(kind=8), allocatable :: eta_in(:)
    real(kind=8), allocatable :: M(:,:), D(:,:), eta(:,:)
! --- temporary variables for convenience
    real(kind=8) :: D_u, udMdx, Ddedx
    real(kind=8) :: dMdx_e
! --- boundary
    real(kind=8) :: uw, ue

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
    if (nt < nout) goto 95


! --- allocation
    allocate(x(nx), t(nt))
    allocate(h(nx), etamax(nx))
    allocate(eta_in(nt))
    allocate(M(nx+1,nt), D(nx,nt), eta(nx,nt))

! --- generate sequential numbers x and t
    t = (/ (tstart + dt*(j-1), j=1,nt) /)
    x = (/ (xmin + dx*(i-1), i=1,nx) /)
    h(1:nx_flat) = h0
    h(nx_flat+1:nx) = (/ (h0 - (x(i)-xflat)*slope, i=nx_flat+1,nx) /)
! --- print depth
    open(unit=fid_h, file='depth_h.dat', status='replace', action='write', err=99)
    write(fid_h,'(2(1pe9.3, 1x))') (x(i), h(i), i=1,nx)
    close(fid_h)

! --- output parameters
    allocate(tout(nout))
    if (mod(nt-1,nout-1) /= 0) goto 96
    nskip = nint(dble(nt-1)/dble(nout-1))
    dtout = dt*dble(nskip)
    tout =  (/ (tstart + dtout*(j-1), j=1,nout) /)
!   check
!    write(*,'(1pe12.5)') (tout(j), j=1,nout)

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


! --- initial condition
    eta(:,1) = 0.0d0
    D(:,1) = h(:) + eta(:,1)
    etamax(:) = 0.0d0

! --- integration
    do j = 1,nt-1
        ! --- momentum
        do i = 2,nx
            D_u = !!! Please write the appropriate code here. !!!
            Ddedx = !!! Please write the appropriate code here. !!!
            udMdx = !!! Please write the appropriate code here. !!!
            M(i,j+1) = M(i,j) - dt*(udMdx + g*Ddedx)
            ! --- error checker
            if (M(i,j+1) /= M(i,j+1)) goto 97
            ! --- tolerance
            if (abs(M(i,j+1)) <= epsilon(M(i,j+1))) M(i,j+1) = 0.0d0
        enddo

        ! --- boundary condition 
        !    -- Sommerfeld radiation condition
        uw = dsqrt(g*D(1,j))
        ue = dsqrt(g*D(nx,j))
        M(1,j+1) = M(2,j) + (uw*dt-dx)/(uw*dt+dx)*(M(2,j+1)-M(1,j))
        M(nx+1,j+1) = M(nx,j) - (ue*dt-dx)/(ue*dt+dx)*(M(nx+1,j)-M(nx,j+1))

        ! --- continuity
        do i = 1,nx
            dMdx_e = !!! Please write the appropriate code here. !!!
            eta(i,j+1) = eta(i,j) - dt*dMdx_e
        enddo
        ! --- incident wave from the west boundary
        eta(1,j+1) = eta(1,j+1) + 2.0d0*(eta_in(j+1)-eta_in(j))
        
        ! --- total depth
        D(:,j+1) = eta(:,j+1) + h(:)        
        ! --- error checker
        if (D(i,j+1) /= D(i,j+1)) goto 98
        ! --- tolerance
        if (abs(D(i,j+1)) <= epsilon(D(i,j+1))) then
            D(i,j+1) = h(i)
            eta(i,j+1) = 0.0d0
        endif

        ! --- record if max
        do i = 1,nx
            etamax(i) = dmax1(etamax(i),eta(i,j+1))
        enddo
    enddo

! --- output format set
    write(fmt1,'(I0)') nout
    fmt1 = '("# output t =",'//trim(fmt1)//'(f7.2,1x))'
    write(fmt2,'(I0)') nout+1
    fmt2 = '('//trim(fmt2)//'(1pe12.4,1x))'

! --- print
    ! -- time-series of eta
    open(unit=fid_out, file=trim(fname_out), status='replace', action='write', err=99)
    write(fid_out,'(A,I0,A,I0,A,1pe11.4,A,1pe11.4)') &
    &     "# nx = ",nx, ", nt = ", nt, ", dx = ", dx, ", dt = ", dt
    write(fid_out,'(A,I0)') "# x, t0, t1, t2, ..., t", nout-1
    write(fid_out,fmt1) (tout(i),i=1,nout)
    write(fid_out,fmt2) (x(i),(eta(i,j), j=1,nt,nskip), i=1,nx) 
    close(fid_out)

    ! -- eta max
    open(unit=fid_h, file='eta_max.dat', status='replace', action='write', err=99)
    write(fid_h,'(2(1pe9.3, 1x))') (x(i), etamax(i), i=1,nx)
    close(fid_h)

! --- deallocate
    deallocate(x,t)
    deallocate(h)
    deallocate(eta_in,etamax)
    deallocate(M,D,eta)
    deallocate(tout)

! --- main rountine end
    return

! --- exceptions and error messages
 95 write(*,'(A,I0,A,I0)') 'nout ',nout, " must be equal to or smaller than nt ", nt
    return
! --- exceptions and error messages
 96 write(*,'(A,I0,A,I0)') 'nout must be a number divisible by nt. nt = ',nt, ", nout = ", nout
    return
! --- exceptions and error messages
 97 print *, 'detect NaN in flux M : i =',i, ", j =", j 
    write(*,'(4(1pe12.4,2x))') M(i,j), M(i+1,j), M(i-1,j), M(i,j-1)
    return
! --- exceptions and error messages
 98 print *, 'detect NaN in total depth D : i =',i, ", j =", j 
    write(*,'(4(1pe12.4,2x))') D(i,j), D(i+1,j), D(i-1,j), D(i,j-1)
    return
! --- exceptions and error messages
 99 print *, 'Failed to open a file to output'
    return

end program exercise_longwave1d