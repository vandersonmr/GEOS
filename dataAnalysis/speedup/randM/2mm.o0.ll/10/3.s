	.text
	.file	"3.ll"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI0_0:
	.quad	4621819117588971520     # double 10
	.text
	.globl	polybench_flush_cache
	.align	16, 0x90
	.type	polybench_flush_cache,@function
polybench_flush_cache:                  # @polybench_flush_cache
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp2:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$4194560, -4(%rbp)      # imm = 0x400100
	movslq	-4(%rbp), %rdi
	movl	$8, %esi
	callq	calloc
	movq	%rax, -16(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -20(%rbp)
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_2:                                #   in Loop: Header=BB0_1 Depth=1
	movslq	-20(%rbp), %rax
	movq	-16(%rbp), %rcx
	movsd	(%rcx,%rax,8), %xmm0
	addsd	-32(%rbp), %xmm0
	movsd	%xmm0, -32(%rbp)
	incl	-20(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.LBB0_2
# BB#3:
	movsd	.LCPI0_0(%rip), %xmm0
	ucomisd	-32(%rbp), %xmm0
	jb	.LBB0_5
# BB#4:
	movq	-16(%rbp), %rdi
	callq	free
	addq	$32, %rsp
	popq	%rbp
	retq
.LBB0_5:
	movl	$.L.str, %edi
	movl	$.L.str1, %esi
	movl	$97, %edx
	movl	$.L__PRETTY_FUNCTION__.polybench_flush_cache, %ecx
	callq	__assert_fail
.Ltmp3:
	.size	polybench_flush_cache, .Ltmp3-polybench_flush_cache
	.cfi_endproc

	.globl	polybench_prepare_instruments
	.align	16, 0x90
	.type	polybench_prepare_instruments,@function
polybench_prepare_instruments:          # @polybench_prepare_instruments
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp4:
	.cfi_def_cfa_offset 16
.Ltmp5:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp6:
	.cfi_def_cfa_register %rbp
	callq	polybench_flush_cache
	popq	%rbp
	retq
.Ltmp7:
	.size	polybench_prepare_instruments, .Ltmp7-polybench_prepare_instruments
	.cfi_endproc

	.globl	polybench_timer_start
	.align	16, 0x90
	.type	polybench_timer_start,@function
polybench_timer_start:                  # @polybench_timer_start
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp8:
	.cfi_def_cfa_offset 16
.Ltmp9:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp10:
	.cfi_def_cfa_register %rbp
	callq	polybench_prepare_instruments
	callq	rtclock
	movsd	%xmm0, polybench_t_start(%rip)
	popq	%rbp
	retq
.Ltmp11:
	.size	polybench_timer_start, .Ltmp11-polybench_timer_start
	.cfi_endproc

	.globl	polybench_timer_stop
	.align	16, 0x90
	.type	polybench_timer_stop,@function
polybench_timer_stop:                   # @polybench_timer_stop
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp12:
	.cfi_def_cfa_offset 16
.Ltmp13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp14:
	.cfi_def_cfa_register %rbp
	callq	rtclock
	movsd	%xmm0, polybench_t_end(%rip)
	popq	%rbp
	retq
.Ltmp15:
	.size	polybench_timer_stop, .Ltmp15-polybench_timer_stop
	.cfi_endproc

	.globl	polybench_timer_print
	.align	16, 0x90
	.type	polybench_timer_print,@function
polybench_timer_print:                  # @polybench_timer_print
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp16:
	.cfi_def_cfa_offset 16
.Ltmp17:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp18:
	.cfi_def_cfa_register %rbp
	movsd	polybench_t_end(%rip), %xmm0
	subsd	polybench_t_start(%rip), %xmm0
	movl	$.L.str2, %edi
	movb	$1, %al
	callq	printf
	popq	%rbp
	retq
.Ltmp19:
	.size	polybench_timer_print, .Ltmp19-polybench_timer_print
	.cfi_endproc

	.globl	polybench_alloc_data
	.align	16, 0x90
	.type	polybench_alloc_data,@function
polybench_alloc_data:                   # @polybench_alloc_data
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp20:
	.cfi_def_cfa_offset 16
.Ltmp21:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp22:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movslq	-8(%rbp), %rax
	movslq	-4(%rbp), %rdi
	imulq	%rax, %rdi
	callq	xmalloc
	movq	%rax, -16(%rbp)
	addq	$16, %rsp
	popq	%rbp
	retq
.Ltmp23:
	.size	polybench_alloc_data, .Ltmp23-polybench_alloc_data
	.cfi_endproc

	.align	16, 0x90
	.type	xmalloc,@function
xmalloc:                                # @xmalloc
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp24:
	.cfi_def_cfa_offset 16
.Ltmp25:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp26:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	-8(%rbp), %rdx
	leaq	-16(%rbp), %rdi
	movl	$32, %esi
	callq	posix_memalign
	movl	%eax, -20(%rbp)
	cmpq	$0, -16(%rbp)
	je	.LBB6_3
# BB#1:
	cmpl	$0, -20(%rbp)
	jne	.LBB6_3
# BB#2:
	movq	-16(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
.LBB6_3:
	movq	stderr(%rip), %rdi
	movl	$.L.str3, %esi
	xorl	%eax, %eax
	callq	fprintf
	movl	$1, %edi
	callq	exit
.Ltmp27:
	.size	xmalloc, .Ltmp27-xmalloc
	.cfi_endproc

	.align	16, 0x90
	.type	rtclock,@function
rtclock:                                # @rtclock
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp28:
	.cfi_def_cfa_offset 16
.Ltmp29:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp30:
	.cfi_def_cfa_register %rbp
	xorps	%xmm0, %xmm0
	popq	%rbp
	retq
.Ltmp31:
	.size	rtclock, .Ltmp31-rtclock
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp32:
	.cfi_def_cfa_offset 16
.Ltmp33:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp34:
	.cfi_def_cfa_register %rbp
	subq	$128, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$1024, -20(%rbp)        # imm = 0x400
	movl	$1024, -24(%rbp)        # imm = 0x400
	movl	$1024, -28(%rbp)        # imm = 0x400
	movl	$1024, -32(%rbp)        # imm = 0x400
	movl	$1048576, %edi          # imm = 0x100000
	movl	$8, %esi
	callq	polybench_alloc_data
	movq	%rax, -56(%rbp)
	movl	$1048576, %edi          # imm = 0x100000
	movl	$8, %esi
	callq	polybench_alloc_data
	movq	%rax, -64(%rbp)
	movl	$1048576, %edi          # imm = 0x100000
	movl	$8, %esi
	callq	polybench_alloc_data
	movq	%rax, -72(%rbp)
	movl	$1048576, %edi          # imm = 0x100000
	movl	$8, %esi
	callq	polybench_alloc_data
	movq	%rax, -80(%rbp)
	movl	$1048576, %edi          # imm = 0x100000
	movl	$8, %esi
	callq	polybench_alloc_data
	movq	%rax, -88(%rbp)
	movl	-20(%rbp), %edi
	movl	-24(%rbp), %esi
	movl	-28(%rbp), %edx
	movl	-32(%rbp), %ecx
	movq	-64(%rbp), %r8
	movq	-72(%rbp), %r9
	movq	-80(%rbp), %r10
	movq	%rax, 24(%rsp)
	movq	%r10, 16(%rsp)
	movq	%r9, 8(%rsp)
	movq	%r8, (%rsp)
	leaq	-40(%rbp), %r8
	leaq	-48(%rbp), %r9
	callq	init_array
	movl	-20(%rbp), %edi
	movl	-24(%rbp), %esi
	movl	-28(%rbp), %edx
	movl	-32(%rbp), %ecx
	movsd	-40(%rbp), %xmm0
	movsd	-48(%rbp), %xmm1
	movq	-56(%rbp), %r8
	movq	-64(%rbp), %r9
	movq	-72(%rbp), %r10
	movq	-80(%rbp), %r11
	movq	-88(%rbp), %rax
	movq	%rax, 16(%rsp)
	movq	%r11, 8(%rsp)
	movq	%r10, (%rsp)
	callq	kernel_2mm
	cmpl	$43, -8(%rbp)
	jl	.LBB8_3
# BB#1:
	movq	-16(%rbp), %rax
	movq	(%rax), %rdi
	movl	$.L.str4, %esi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB8_3
# BB#2:
	movl	-20(%rbp), %edi
	movl	-32(%rbp), %esi
	movq	-88(%rbp), %rdx
	callq	print_array
.LBB8_3:
	movq	-56(%rbp), %rdi
	callq	free
	movq	-64(%rbp), %rdi
	callq	free
	movq	-72(%rbp), %rdi
	callq	free
	movq	-80(%rbp), %rdi
	callq	free
	movq	-88(%rbp), %rdi
	callq	free
	xorl	%eax, %eax
	addq	$128, %rsp
	popq	%rbp
	retq
.Ltmp35:
	.size	main, .Ltmp35-main
	.cfi_endproc

	.align	16, 0x90
	.type	init_array,@function
init_array:                             # @init_array
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp36:
	.cfi_def_cfa_offset 16
.Ltmp37:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp38:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
.Ltmp39:
	.cfi_offset %rbx, -24
	movq	40(%rbp), %r10
	movq	32(%rbp), %r11
	movq	24(%rbp), %rax
	movq	16(%rbp), %rbx
	movl	%edi, -12(%rbp)
	movl	%esi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movl	%ecx, -24(%rbp)
	movq	%r8, -32(%rbp)
	movq	%r9, -40(%rbp)
	movq	%rbx, -48(%rbp)
	movq	%rax, -56(%rbp)
	movq	%r11, -64(%rbp)
	movq	%r10, -72(%rbp)
	movq	-32(%rbp), %rax
	movabsq	$4674638556675702784, %rcx # imm = 0x40DFA70000000000
	movq	%rcx, (%rax)
	movq	-40(%rbp), %rax
	movabsq	$4656886941445259264, %rcx # imm = 0x40A0960000000000
	movq	%rcx, (%rax)
	movl	$0, -76(%rbp)
	jmp	.LBB9_1
	.align	16, 0x90
.LBB9_5:                                #   in Loop: Header=BB9_1 Depth=1
	incl	-76(%rbp)
.LBB9_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB9_3 Depth 2
	movl	-76(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB9_6
# BB#2:                                 #   in Loop: Header=BB9_1 Depth=1
	movl	$0, -80(%rbp)
	jmp	.LBB9_3
	.align	16, 0x90
.LBB9_4:                                #   in Loop: Header=BB9_3 Depth=2
	movslq	-76(%rbp), %rax
	cvtsi2sdl	%eax, %xmm0
	movslq	-80(%rbp), %rcx
	cvtsi2sdl	%ecx, %xmm1
	mulsd	%xmm0, %xmm1
	xorps	%xmm0, %xmm0
	cvtsi2sdl	-12(%rbp), %xmm0
	divsd	%xmm0, %xmm1
	shlq	$13, %rax
	addq	-48(%rbp), %rax
	movsd	%xmm1, (%rax,%rcx,8)
	incl	-80(%rbp)
.LBB9_3:                                #   Parent Loop BB9_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-80(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.LBB9_4
	jmp	.LBB9_5
.LBB9_6:
	movl	$0, -76(%rbp)
	jmp	.LBB9_7
	.align	16, 0x90
.LBB9_11:                               #   in Loop: Header=BB9_7 Depth=1
	incl	-76(%rbp)
.LBB9_7:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB9_9 Depth 2
	movl	-76(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.LBB9_12
# BB#8:                                 #   in Loop: Header=BB9_7 Depth=1
	movl	$0, -80(%rbp)
	jmp	.LBB9_9
	.align	16, 0x90
.LBB9_10:                               #   in Loop: Header=BB9_9 Depth=2
	movslq	-76(%rbp), %rax
	cvtsi2sdl	%eax, %xmm0
	movslq	-80(%rbp), %rcx
	leal	1(%rcx), %edx
	cvtsi2sdl	%edx, %xmm1
	mulsd	%xmm0, %xmm1
	xorps	%xmm0, %xmm0
	cvtsi2sdl	-16(%rbp), %xmm0
	divsd	%xmm0, %xmm1
	shlq	$13, %rax
	addq	-56(%rbp), %rax
	movsd	%xmm1, (%rax,%rcx,8)
	incl	-80(%rbp)
.LBB9_9:                                #   Parent Loop BB9_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-80(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jl	.LBB9_10
	jmp	.LBB9_11
.LBB9_12:
	movl	$0, -76(%rbp)
	jmp	.LBB9_13
	.align	16, 0x90
.LBB9_17:                               #   in Loop: Header=BB9_13 Depth=1
	incl	-76(%rbp)
.LBB9_13:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB9_15 Depth 2
	movl	-76(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jge	.LBB9_18
# BB#14:                                #   in Loop: Header=BB9_13 Depth=1
	movl	$0, -80(%rbp)
	jmp	.LBB9_15
	.align	16, 0x90
.LBB9_16:                               #   in Loop: Header=BB9_15 Depth=2
	movslq	-76(%rbp), %rax
	cvtsi2sdl	%eax, %xmm0
	movslq	-80(%rbp), %rcx
	leal	3(%rcx), %edx
	cvtsi2sdl	%edx, %xmm1
	mulsd	%xmm0, %xmm1
	xorps	%xmm0, %xmm0
	cvtsi2sdl	-24(%rbp), %xmm0
	divsd	%xmm0, %xmm1
	shlq	$13, %rax
	addq	-64(%rbp), %rax
	movsd	%xmm1, (%rax,%rcx,8)
	incl	-80(%rbp)
.LBB9_15:                               #   Parent Loop BB9_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-80(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jl	.LBB9_16
	jmp	.LBB9_17
.LBB9_18:
	movl	$0, -76(%rbp)
	jmp	.LBB9_19
	.align	16, 0x90
.LBB9_23:                               #   in Loop: Header=BB9_19 Depth=1
	incl	-76(%rbp)
.LBB9_19:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB9_21 Depth 2
	movl	-76(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB9_24
# BB#20:                                #   in Loop: Header=BB9_19 Depth=1
	movl	$0, -80(%rbp)
	jmp	.LBB9_21
	.align	16, 0x90
.LBB9_22:                               #   in Loop: Header=BB9_21 Depth=2
	movslq	-76(%rbp), %rax
	cvtsi2sdl	%eax, %xmm0
	movslq	-80(%rbp), %rcx
	leal	2(%rcx), %edx
	cvtsi2sdl	%edx, %xmm1
	mulsd	%xmm0, %xmm1
	xorps	%xmm0, %xmm0
	cvtsi2sdl	-20(%rbp), %xmm0
	divsd	%xmm0, %xmm1
	shlq	$13, %rax
	addq	-72(%rbp), %rax
	movsd	%xmm1, (%rax,%rcx,8)
	incl	-80(%rbp)
.LBB9_21:                               #   Parent Loop BB9_19 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-80(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jl	.LBB9_22
	jmp	.LBB9_23
.LBB9_24:
	popq	%rbx
	popq	%rbp
	retq
.Ltmp40:
	.size	init_array, .Ltmp40-init_array
	.cfi_endproc

	.align	16, 0x90
	.type	kernel_2mm,@function
kernel_2mm:                             # @kernel_2mm
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp41:
	.cfi_def_cfa_offset 16
.Ltmp42:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp43:
	.cfi_def_cfa_register %rbp
	movq	32(%rbp), %r10
	movq	24(%rbp), %r11
	movq	16(%rbp), %rax
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	movl	%ecx, -16(%rbp)
	movsd	%xmm0, -24(%rbp)
	movsd	%xmm1, -32(%rbp)
	movq	%r8, -40(%rbp)
	movq	%r9, -48(%rbp)
	movq	%rax, -56(%rbp)
	movq	%r11, -64(%rbp)
	movq	%r10, -72(%rbp)
	movl	$0, -76(%rbp)
	jmp	.LBB10_1
	.align	16, 0x90
.LBB10_8:                               #   in Loop: Header=BB10_1 Depth=1
	incl	-76(%rbp)
.LBB10_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB10_3 Depth 2
                                        #       Child Loop BB10_5 Depth 3
	movl	-76(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.LBB10_9
# BB#2:                                 #   in Loop: Header=BB10_1 Depth=1
	movl	$0, -80(%rbp)
	jmp	.LBB10_3
	.align	16, 0x90
.LBB10_7:                               #   in Loop: Header=BB10_3 Depth=2
	incl	-80(%rbp)
.LBB10_3:                               #   Parent Loop BB10_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB10_5 Depth 3
	movl	-80(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.LBB10_8
# BB#4:                                 #   in Loop: Header=BB10_3 Depth=2
	movslq	-80(%rbp), %rax
	movslq	-76(%rbp), %rcx
	shlq	$13, %rcx
	addq	-40(%rbp), %rcx
	movq	$0, (%rcx,%rax,8)
	movl	$0, -84(%rbp)
	jmp	.LBB10_5
	.align	16, 0x90
.LBB10_6:                               #   in Loop: Header=BB10_5 Depth=3
	movsd	-24(%rbp), %xmm0
	movslq	-84(%rbp), %rax
	movslq	-76(%rbp), %rcx
	shlq	$13, %rcx
	movq	-48(%rbp), %rdx
	addq	%rcx, %rdx
	mulsd	(%rdx,%rax,8), %xmm0
	movslq	-80(%rbp), %rdx
	shlq	$13, %rax
	addq	-56(%rbp), %rax
	mulsd	(%rax,%rdx,8), %xmm0
	addq	-40(%rbp), %rcx
	addsd	(%rcx,%rdx,8), %xmm0
	movsd	%xmm0, (%rcx,%rdx,8)
	incl	-84(%rbp)
.LBB10_5:                               #   Parent Loop BB10_1 Depth=1
                                        #     Parent Loop BB10_3 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-84(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jl	.LBB10_6
	jmp	.LBB10_7
.LBB10_9:
	movl	$0, -76(%rbp)
	jmp	.LBB10_10
	.align	16, 0x90
.LBB10_17:                              #   in Loop: Header=BB10_10 Depth=1
	incl	-76(%rbp)
.LBB10_10:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB10_12 Depth 2
                                        #       Child Loop BB10_14 Depth 3
	movl	-76(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.LBB10_18
# BB#11:                                #   in Loop: Header=BB10_10 Depth=1
	movl	$0, -80(%rbp)
	jmp	.LBB10_12
	.align	16, 0x90
.LBB10_16:                              #   in Loop: Header=BB10_12 Depth=2
	incl	-80(%rbp)
.LBB10_12:                              #   Parent Loop BB10_10 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB10_14 Depth 3
	movl	-80(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB10_17
# BB#13:                                #   in Loop: Header=BB10_12 Depth=2
	movsd	-32(%rbp), %xmm0
	movslq	-80(%rbp), %rax
	movslq	-76(%rbp), %rcx
	shlq	$13, %rcx
	addq	-72(%rbp), %rcx
	mulsd	(%rcx,%rax,8), %xmm0
	movsd	%xmm0, (%rcx,%rax,8)
	movl	$0, -84(%rbp)
	jmp	.LBB10_14
	.align	16, 0x90
.LBB10_15:                              #   in Loop: Header=BB10_14 Depth=3
	movslq	-84(%rbp), %rax
	movslq	-76(%rbp), %rcx
	shlq	$13, %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movsd	(%rdx,%rax,8), %xmm0
	movslq	-80(%rbp), %rdx
	shlq	$13, %rax
	addq	-64(%rbp), %rax
	mulsd	(%rax,%rdx,8), %xmm0
	addq	-72(%rbp), %rcx
	addsd	(%rcx,%rdx,8), %xmm0
	movsd	%xmm0, (%rcx,%rdx,8)
	incl	-84(%rbp)
.LBB10_14:                              #   Parent Loop BB10_10 Depth=1
                                        #     Parent Loop BB10_12 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-84(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.LBB10_15
	jmp	.LBB10_16
.LBB10_18:
	popq	%rbp
	retq
.Ltmp44:
	.size	kernel_2mm, .Ltmp44-kernel_2mm
	.cfi_endproc

	.align	16, 0x90
	.type	print_array,@function
print_array:                            # @print_array
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp45:
	.cfi_def_cfa_offset 16
.Ltmp46:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp47:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movq	%rdx, -16(%rbp)
	movl	$0, -20(%rbp)
	jmp	.LBB11_1
	.align	16, 0x90
.LBB11_7:                               #   in Loop: Header=BB11_1 Depth=1
	incl	-20(%rbp)
.LBB11_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB11_3 Depth 2
	movl	-20(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.LBB11_8
# BB#2:                                 #   in Loop: Header=BB11_1 Depth=1
	movl	$0, -24(%rbp)
	jmp	.LBB11_3
	.align	16, 0x90
.LBB11_6:                               #   in Loop: Header=BB11_3 Depth=2
	incl	-24(%rbp)
.LBB11_3:                               #   Parent Loop BB11_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-24(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.LBB11_7
# BB#4:                                 #   in Loop: Header=BB11_3 Depth=2
	movq	stderr(%rip), %rdi
	movslq	-24(%rbp), %rax
	movslq	-20(%rbp), %rcx
	shlq	$13, %rcx
	addq	-16(%rbp), %rcx
	movsd	(%rcx,%rax,8), %xmm0
	movl	$.L.str15, %esi
	movb	$1, %al
	callq	fprintf
	movl	-4(%rbp), %eax
	imull	-20(%rbp), %eax
	addl	-24(%rbp), %eax
	cltq
	imulq	$1717986919, %rax, %rcx # imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$35, %rcx
	addl	%edx, %ecx
	imull	$20, %ecx, %ecx
	cmpl	%ecx, %eax
	jne	.LBB11_6
# BB#5:                                 #   in Loop: Header=BB11_3 Depth=2
	movq	stderr(%rip), %rdi
	movl	$.L.str26, %esi
	xorl	%eax, %eax
	callq	fprintf
	jmp	.LBB11_6
.LBB11_8:
	movq	stderr(%rip), %rdi
	movl	$.L.str26, %esi
	xorl	%eax, %eax
	callq	fprintf
	addq	$32, %rsp
	popq	%rbp
	retq
.Ltmp48:
	.size	print_array, .Ltmp48-print_array
	.cfi_endproc

	.type	polybench_papi_counters_threadid,@object # @polybench_papi_counters_threadid
	.bss
	.globl	polybench_papi_counters_threadid
	.align	4
polybench_papi_counters_threadid:
	.long	0                       # 0x0
	.size	polybench_papi_counters_threadid, 4

	.type	polybench_program_total_flops,@object # @polybench_program_total_flops
	.globl	polybench_program_total_flops
	.align	8
polybench_program_total_flops:
	.quad	0                       # double 0
	.size	polybench_program_total_flops, 8

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"tmp <= 10.0"
	.size	.L.str, 12

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	"utilities/polybench.c"
	.size	.L.str1, 22

	.type	.L__PRETTY_FUNCTION__.polybench_flush_cache,@object # @__PRETTY_FUNCTION__.polybench_flush_cache
.L__PRETTY_FUNCTION__.polybench_flush_cache:
	.asciz	"void polybench_flush_cache()"
	.size	.L__PRETTY_FUNCTION__.polybench_flush_cache, 29

	.type	polybench_t_start,@object # @polybench_t_start
	.comm	polybench_t_start,8,8
	.type	polybench_t_end,@object # @polybench_t_end
	.comm	polybench_t_end,8,8
	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	"%0.6f\n"
	.size	.L.str2, 7

	.type	polybench_c_start,@object # @polybench_c_start
	.comm	polybench_c_start,8,8
	.type	polybench_c_end,@object # @polybench_c_end
	.comm	polybench_c_end,8,8
	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	"[PolyBench] posix_memalign: cannot allocate memory"
	.size	.L.str3, 51

	.type	.L.str4,@object         # @.str4
.L.str4:
	.zero	1
	.size	.L.str4, 1

	.type	.L.str15,@object        # @.str15
.L.str15:
	.asciz	"%0.2lf "
	.size	.L.str15, 8

	.type	.L.str26,@object        # @.str26
.L.str26:
	.asciz	"\n"
	.size	.L.str26, 2


	.ident	"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"
	.ident	"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"
	.section	".note.GNU-stack","",@progbits
