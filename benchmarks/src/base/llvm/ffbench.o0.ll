; ModuleID = 'ffbench.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@main.nsize = internal global [3 x i32] zeroinitializer, align 4
@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [28 x i8] c"Can't allocate data array.\0A\00", align 1
@.str1 = private unnamed_addr constant [48 x i8] c"Wrong answer at (%d,%d)!  Expected %d, got %d.\0A\00", align 1
@.str2 = private unnamed_addr constant [35 x i8] c"%d passes.  No errors in results.\0A\00", align 1
@.str3 = private unnamed_addr constant [35 x i8] c"%d passes.  %d errors in results.\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %npasses = alloca i32, align 4
  %faedge = alloca i32, align 4
  %fdata = alloca double*, align 8
  %fanum = alloca i64, align 8
  %fasize = alloca i64, align 8
  %mapbase = alloca double, align 8
  %mapscale = alloca double, align 8
  %rmin = alloca double, align 8
  %rmax = alloca double, align 8
  %imin = alloca double, align 8
  %imax = alloca double, align 8
  %r = alloca double, align 8
  %ij = alloca double, align 8
  %ar = alloca double, align 8
  %ai = alloca double, align 8
  store i32 0, i32* %1
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !23), !dbg !24
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !25), !dbg !24
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !26), !dbg !24
  call void @llvm.dbg.declare(metadata !{i32* %l}, metadata !27), !dbg !24
  call void @llvm.dbg.declare(metadata !{i32* %m}, metadata !28), !dbg !24
  call void @llvm.dbg.declare(metadata !{i32* %npasses}, metadata !29), !dbg !24
  store i32 63, i32* %npasses, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata !{i32* %faedge}, metadata !30), !dbg !24
  call void @llvm.dbg.declare(metadata !{double** %fdata}, metadata !31), !dbg !32
  call void @llvm.dbg.declare(metadata !{i64* %fanum}, metadata !33), !dbg !35
  call void @llvm.dbg.declare(metadata !{i64* %fasize}, metadata !36), !dbg !35
  call void @llvm.dbg.declare(metadata !{double* %mapbase}, metadata !37), !dbg !38
  call void @llvm.dbg.declare(metadata !{double* %mapscale}, metadata !39), !dbg !38
  call void @llvm.dbg.declare(metadata !{double* %rmin}, metadata !40), !dbg !38
  call void @llvm.dbg.declare(metadata !{double* %rmax}, metadata !41), !dbg !38
  call void @llvm.dbg.declare(metadata !{double* %imin}, metadata !42), !dbg !38
  call void @llvm.dbg.declare(metadata !{double* %imax}, metadata !43), !dbg !38
  store i32 256, i32* %faedge, align 4, !dbg !44
  %2 = load i32* %faedge, align 4, !dbg !45
  %3 = load i32* %faedge, align 4, !dbg !45
  %4 = mul nsw i32 %2, %3, !dbg !45
  %5 = sext i32 %4 to i64, !dbg !45
  store i64 %5, i64* %fanum, align 8, !dbg !45
  %6 = load i64* %fanum, align 8, !dbg !46
  %7 = add nsw i64 %6, 1, !dbg !46
  %8 = mul nsw i64 %7, 2, !dbg !46
  %9 = mul i64 %8, 8, !dbg !46
  store i64 %9, i64* %fasize, align 8, !dbg !46
  %10 = load i32* %faedge, align 4, !dbg !47
  store i32 %10, i32* getelementptr inbounds ([3 x i32]* @main.nsize, i32 0, i64 2), align 4, !dbg !47
  store i32 %10, i32* getelementptr inbounds ([3 x i32]* @main.nsize, i32 0, i64 1), align 4, !dbg !47
  %11 = load i64* %fasize, align 8, !dbg !48
  %12 = call noalias i8* @malloc(i64 %11) #5, !dbg !48
  %13 = bitcast i8* %12 to double*, !dbg !48
  store double* %13, double** %fdata, align 8, !dbg !48
  %14 = load double** %fdata, align 8, !dbg !49
  %15 = icmp eq double* %14, null, !dbg !49
  br i1 %15, label %16, label %19, !dbg !49

; <label>:16                                      ; preds = %0
  %17 = load %struct._IO_FILE** @stderr, align 8, !dbg !51
  %18 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([28 x i8]* @.str, i32 0, i32 0)), !dbg !51
  call void @exit(i32 1) #6, !dbg !53
  unreachable, !dbg !53

; <label>:19                                      ; preds = %0
  %20 = load double** %fdata, align 8, !dbg !54
  %21 = bitcast double* %20 to i8*, !dbg !54
  %22 = load i64* %fasize, align 8, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* %21, i8 0, i64 %22, i32 8, i1 false), !dbg !54
  store i32 0, i32* %i, align 4, !dbg !55
  br label %23, !dbg !55

; <label>:23                                      ; preds = %56, %19
  %24 = load i32* %i, align 4, !dbg !55
  %25 = load i32* %faedge, align 4, !dbg !55
  %26 = icmp slt i32 %24, %25, !dbg !55
  br i1 %26, label %27, label %59, !dbg !55

; <label>:27                                      ; preds = %23
  store i32 0, i32* %j, align 4, !dbg !57
  br label %28, !dbg !57

; <label>:28                                      ; preds = %52, %27
  %29 = load i32* %j, align 4, !dbg !57
  %30 = load i32* %faedge, align 4, !dbg !57
  %31 = icmp slt i32 %29, %30, !dbg !57
  br i1 %31, label %32, label %55, !dbg !57

; <label>:32                                      ; preds = %28
  %33 = load i32* %i, align 4, !dbg !60
  %34 = and i32 %33, 15, !dbg !60
  %35 = icmp eq i32 %34, 8, !dbg !60
  br i1 %35, label %40, label %36, !dbg !60

; <label>:36                                      ; preds = %32
  %37 = load i32* %j, align 4, !dbg !60
  %38 = and i32 %37, 15, !dbg !60
  %39 = icmp eq i32 %38, 8, !dbg !60
  br i1 %39, label %40, label %51, !dbg !60

; <label>:40                                      ; preds = %36, %32
  %41 = load i32* %faedge, align 4, !dbg !63
  %42 = load i32* %i, align 4, !dbg !63
  %43 = mul nsw i32 %41, %42, !dbg !63
  %44 = load i32* %j, align 4, !dbg !63
  %45 = add nsw i32 %43, %44, !dbg !63
  %46 = mul nsw i32 %45, 2, !dbg !63
  %47 = add nsw i32 1, %46, !dbg !63
  %48 = sext i32 %47 to i64, !dbg !63
  %49 = load double** %fdata, align 8, !dbg !63
  %50 = getelementptr inbounds double* %49, i64 %48, !dbg !63
  store double 1.280000e+02, double* %50, align 8, !dbg !63
  br label %51, !dbg !63

; <label>:51                                      ; preds = %40, %36
  br label %52, !dbg !64

; <label>:52                                      ; preds = %51
  %53 = load i32* %j, align 4, !dbg !57
  %54 = add nsw i32 %53, 1, !dbg !57
  store i32 %54, i32* %j, align 4, !dbg !57
  br label %28, !dbg !57

; <label>:55                                      ; preds = %28
  br label %56, !dbg !65

; <label>:56                                      ; preds = %55
  %57 = load i32* %i, align 4, !dbg !55
  %58 = add nsw i32 %57, 1, !dbg !55
  store i32 %58, i32* %i, align 4, !dbg !55
  br label %23, !dbg !55

; <label>:59                                      ; preds = %23
  store i32 0, i32* %i, align 4, !dbg !66
  br label %60, !dbg !66

; <label>:60                                      ; preds = %67, %59
  %61 = load i32* %i, align 4, !dbg !66
  %62 = load i32* %npasses, align 4, !dbg !66
  %63 = icmp slt i32 %61, %62, !dbg !66
  br i1 %63, label %64, label %70, !dbg !66

; <label>:64                                      ; preds = %60
  %65 = load double** %fdata, align 8, !dbg !68
  call void @fourn(double* %65, i32* getelementptr inbounds ([3 x i32]* @main.nsize, i32 0, i32 0), i32 2, i32 1), !dbg !68
  %66 = load double** %fdata, align 8, !dbg !70
  call void @fourn(double* %66, i32* getelementptr inbounds ([3 x i32]* @main.nsize, i32 0, i32 0), i32 2, i32 -1), !dbg !70
  br label %67, !dbg !71

; <label>:67                                      ; preds = %64
  %68 = load i32* %i, align 4, !dbg !66
  %69 = add nsw i32 %68, 1, !dbg !66
  store i32 %69, i32* %i, align 4, !dbg !66
  br label %60, !dbg !66

; <label>:70                                      ; preds = %60
  call void @llvm.dbg.declare(metadata !{double* %r}, metadata !72), !dbg !74
  call void @llvm.dbg.declare(metadata !{double* %ij}, metadata !75), !dbg !74
  call void @llvm.dbg.declare(metadata !{double* %ar}, metadata !76), !dbg !74
  call void @llvm.dbg.declare(metadata !{double* %ai}, metadata !77), !dbg !74
  store double 1.000000e+10, double* %rmin, align 8, !dbg !78
  store double -1.000000e+10, double* %rmax, align 8, !dbg !78
  store double 1.000000e+10, double* %imin, align 8, !dbg !79
  store double -1.000000e+10, double* %imax, align 8, !dbg !79
  store double 0.000000e+00, double* %ar, align 8, !dbg !80
  store double 0.000000e+00, double* %ai, align 8, !dbg !81
  store i32 1, i32* %i, align 4, !dbg !82
  br label %71, !dbg !82

; <label>:71                                      ; preds = %130, %70
  %72 = load i32* %i, align 4, !dbg !82
  %73 = sext i32 %72 to i64, !dbg !82
  %74 = load i64* %fanum, align 8, !dbg !82
  %75 = icmp sle i64 %73, %74, !dbg !82
  br i1 %75, label %76, label %133, !dbg !82

; <label>:76                                      ; preds = %71
  %77 = load i32* %i, align 4, !dbg !84
  %78 = sext i32 %77 to i64, !dbg !84
  %79 = load double** %fdata, align 8, !dbg !84
  %80 = getelementptr inbounds double* %79, i64 %78, !dbg !84
  %81 = load double* %80, align 8, !dbg !84
  store double %81, double* %r, align 8, !dbg !84
  %82 = load i32* %i, align 4, !dbg !86
  %83 = add nsw i32 %82, 1, !dbg !86
  %84 = sext i32 %83 to i64, !dbg !86
  %85 = load double** %fdata, align 8, !dbg !86
  %86 = getelementptr inbounds double* %85, i64 %84, !dbg !86
  %87 = load double* %86, align 8, !dbg !86
  store double %87, double* %ij, align 8, !dbg !86
  %88 = load double* %r, align 8, !dbg !87
  %89 = load double* %ar, align 8, !dbg !87
  %90 = fadd double %89, %88, !dbg !87
  store double %90, double* %ar, align 8, !dbg !87
  %91 = load double* %ij, align 8, !dbg !88
  %92 = load double* %ai, align 8, !dbg !88
  %93 = fadd double %92, %91, !dbg !88
  store double %93, double* %ai, align 8, !dbg !88
  %94 = load double* %r, align 8, !dbg !89
  %95 = load double* %rmin, align 8, !dbg !89
  %96 = fcmp ole double %94, %95, !dbg !89
  br i1 %96, label %97, label %99, !dbg !89

; <label>:97                                      ; preds = %76
  %98 = load double* %r, align 8, !dbg !89
  br label %101, !dbg !89

; <label>:99                                      ; preds = %76
  %100 = load double* %rmin, align 8, !dbg !89
  br label %101, !dbg !89

; <label>:101                                     ; preds = %99, %97
  %102 = phi double [ %98, %97 ], [ %100, %99 ], !dbg !89
  store double %102, double* %rmin, align 8, !dbg !89
  %103 = load double* %r, align 8, !dbg !90
  %104 = load double* %rmax, align 8, !dbg !90
  %105 = fcmp ogt double %103, %104, !dbg !90
  br i1 %105, label %106, label %108, !dbg !90

; <label>:106                                     ; preds = %101
  %107 = load double* %r, align 8, !dbg !90
  br label %110, !dbg !90

; <label>:108                                     ; preds = %101
  %109 = load double* %rmax, align 8, !dbg !90
  br label %110, !dbg !90

; <label>:110                                     ; preds = %108, %106
  %111 = phi double [ %107, %106 ], [ %109, %108 ], !dbg !90
  store double %111, double* %rmax, align 8, !dbg !90
  %112 = load double* %ij, align 8, !dbg !91
  %113 = load double* %imin, align 8, !dbg !91
  %114 = fcmp ole double %112, %113, !dbg !91
  br i1 %114, label %115, label %117, !dbg !91

; <label>:115                                     ; preds = %110
  %116 = load double* %ij, align 8, !dbg !91
  br label %119, !dbg !91

; <label>:117                                     ; preds = %110
  %118 = load double* %imin, align 8, !dbg !91
  br label %119, !dbg !91

; <label>:119                                     ; preds = %117, %115
  %120 = phi double [ %116, %115 ], [ %118, %117 ], !dbg !91
  store double %120, double* %imin, align 8, !dbg !91
  %121 = load double* %ij, align 8, !dbg !92
  %122 = load double* %imax, align 8, !dbg !92
  %123 = fcmp ogt double %121, %122, !dbg !92
  br i1 %123, label %124, label %126, !dbg !92

; <label>:124                                     ; preds = %119
  %125 = load double* %ij, align 8, !dbg !92
  br label %128, !dbg !92

; <label>:126                                     ; preds = %119
  %127 = load double* %imax, align 8, !dbg !92
  br label %128, !dbg !92

; <label>:128                                     ; preds = %126, %124
  %129 = phi double [ %125, %124 ], [ %127, %126 ], !dbg !92
  store double %129, double* %imax, align 8, !dbg !92
  br label %130, !dbg !93

; <label>:130                                     ; preds = %128
  %131 = load i32* %i, align 4, !dbg !82
  %132 = add nsw i32 %131, 2, !dbg !82
  store i32 %132, i32* %i, align 4, !dbg !82
  br label %71, !dbg !82

; <label>:133                                     ; preds = %71
  %134 = load double* %rmin, align 8, !dbg !94
  store double %134, double* %mapbase, align 8, !dbg !94
  %135 = load double* %rmax, align 8, !dbg !95
  %136 = load double* %rmin, align 8, !dbg !95
  %137 = fsub double %135, %136, !dbg !95
  %138 = fdiv double 2.550000e+02, %137, !dbg !95
  store double %138, double* %mapscale, align 8, !dbg !95
  store i32 0, i32* %m, align 4, !dbg !96
  store i32 0, i32* %i, align 4, !dbg !97
  br label %139, !dbg !97

; <label>:139                                     ; preds = %192, %133
  %140 = load i32* %i, align 4, !dbg !97
  %141 = load i32* %faedge, align 4, !dbg !97
  %142 = icmp slt i32 %140, %141, !dbg !97
  br i1 %142, label %143, label %195, !dbg !97

; <label>:143                                     ; preds = %139
  store i32 0, i32* %j, align 4, !dbg !99
  br label %144, !dbg !99

; <label>:144                                     ; preds = %188, %143
  %145 = load i32* %j, align 4, !dbg !99
  %146 = load i32* %faedge, align 4, !dbg !99
  %147 = icmp slt i32 %145, %146, !dbg !99
  br i1 %147, label %148, label %191, !dbg !99

; <label>:148                                     ; preds = %144
  %149 = load i32* %faedge, align 4, !dbg !102
  %150 = load i32* %i, align 4, !dbg !102
  %151 = mul nsw i32 %149, %150, !dbg !102
  %152 = load i32* %j, align 4, !dbg !102
  %153 = add nsw i32 %151, %152, !dbg !102
  %154 = mul nsw i32 %153, 2, !dbg !102
  %155 = add nsw i32 1, %154, !dbg !102
  %156 = sext i32 %155 to i64, !dbg !102
  %157 = load double** %fdata, align 8, !dbg !102
  %158 = getelementptr inbounds double* %157, i64 %156, !dbg !102
  %159 = load double* %158, align 8, !dbg !102
  %160 = load double* %mapbase, align 8, !dbg !102
  %161 = fsub double %159, %160, !dbg !102
  %162 = load double* %mapscale, align 8, !dbg !102
  %163 = fmul double %161, %162, !dbg !102
  %164 = fptosi double %163 to i32, !dbg !102
  store i32 %164, i32* %k, align 4, !dbg !102
  %165 = load i32* %i, align 4, !dbg !104
  %166 = and i32 %165, 15, !dbg !104
  %167 = icmp eq i32 %166, 8, !dbg !104
  br i1 %167, label %172, label %168, !dbg !104

; <label>:168                                     ; preds = %148
  %169 = load i32* %j, align 4, !dbg !104
  %170 = and i32 %169, 15, !dbg !104
  %171 = icmp eq i32 %170, 8, !dbg !104
  br label %172, !dbg !104

; <label>:172                                     ; preds = %168, %148
  %173 = phi i1 [ true, %148 ], [ %171, %168 ]
  %174 = select i1 %173, i32 255, i32 0, !dbg !104
  store i32 %174, i32* %l, align 4, !dbg !104
  %175 = load i32* %k, align 4, !dbg !105
  %176 = load i32* %l, align 4, !dbg !105
  %177 = icmp ne i32 %175, %176, !dbg !105
  br i1 %177, label %178, label %187, !dbg !105

; <label>:178                                     ; preds = %172
  %179 = load i32* %m, align 4, !dbg !107
  %180 = add nsw i32 %179, 1, !dbg !107
  store i32 %180, i32* %m, align 4, !dbg !107
  %181 = load %struct._IO_FILE** @stderr, align 8, !dbg !109
  %182 = load i32* %i, align 4, !dbg !109
  %183 = load i32* %j, align 4, !dbg !109
  %184 = load i32* %l, align 4, !dbg !109
  %185 = load i32* %k, align 4, !dbg !109
  %186 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %181, i8* getelementptr inbounds ([48 x i8]* @.str1, i32 0, i32 0), i32 %182, i32 %183, i32 %184, i32 %185), !dbg !109
  br label %187, !dbg !110

; <label>:187                                     ; preds = %178, %172
  br label %188, !dbg !111

; <label>:188                                     ; preds = %187
  %189 = load i32* %j, align 4, !dbg !99
  %190 = add nsw i32 %189, 1, !dbg !99
  store i32 %190, i32* %j, align 4, !dbg !99
  br label %144, !dbg !99

; <label>:191                                     ; preds = %144
  br label %192, !dbg !112

; <label>:192                                     ; preds = %191
  %193 = load i32* %i, align 4, !dbg !97
  %194 = add nsw i32 %193, 1, !dbg !97
  store i32 %194, i32* %i, align 4, !dbg !97
  br label %139, !dbg !97

; <label>:195                                     ; preds = %139
  %196 = load i32* %m, align 4, !dbg !113
  %197 = icmp eq i32 %196, 0, !dbg !113
  br i1 %197, label %198, label %202, !dbg !113

; <label>:198                                     ; preds = %195
  %199 = load %struct._IO_FILE** @stderr, align 8, !dbg !115
  %200 = load i32* %npasses, align 4, !dbg !115
  %201 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %199, i8* getelementptr inbounds ([35 x i8]* @.str2, i32 0, i32 0), i32 %200), !dbg !115
  br label %207, !dbg !117

; <label>:202                                     ; preds = %195
  %203 = load %struct._IO_FILE** @stderr, align 8, !dbg !118
  %204 = load i32* %npasses, align 4, !dbg !118
  %205 = load i32* %m, align 4, !dbg !118
  %206 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %203, i8* getelementptr inbounds ([35 x i8]* @.str3, i32 0, i32 0), i32 %204, i32 %205), !dbg !118
  br label %207

; <label>:207                                     ; preds = %202, %198
  ret i32 0, !dbg !120
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #5

; Function Attrs: nounwind uwtable
define internal void @fourn(double* %data, i32* %nn, i32 %ndim, i32 %isign) #0 {
  %1 = alloca double*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %i1 = alloca i32, align 4
  %i2 = alloca i32, align 4
  %i3 = alloca i32, align 4
  %i2rev = alloca i32, align 4
  %i3rev = alloca i32, align 4
  %ip1 = alloca i32, align 4
  %ip2 = alloca i32, align 4
  %ip3 = alloca i32, align 4
  %ifp1 = alloca i32, align 4
  %ifp2 = alloca i32, align 4
  %ibit = alloca i32, align 4
  %idim = alloca i32, align 4
  %k1 = alloca i32, align 4
  %k2 = alloca i32, align 4
  %n = alloca i32, align 4
  %nprev = alloca i32, align 4
  %nrem = alloca i32, align 4
  %ntot = alloca i32, align 4
  %tempi = alloca double, align 8
  %tempr = alloca double, align 8
  %theta = alloca double, align 8
  %wi = alloca double, align 8
  %wpi = alloca double, align 8
  %wpr = alloca double, align 8
  %wr = alloca double, align 8
  %wtemp = alloca double, align 8
  store double* %data, double** %1, align 8
  call void @llvm.dbg.declare(metadata !{double** %1}, metadata !121), !dbg !122
  store i32* %nn, i32** %2, align 8
  call void @llvm.dbg.declare(metadata !{i32** %2}, metadata !123), !dbg !124
  store i32 %ndim, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !125), !dbg !124
  store i32 %isign, i32* %4, align 4
  call void @llvm.dbg.declare(metadata !{i32* %4}, metadata !126), !dbg !124
  call void @llvm.dbg.declare(metadata !{i32* %i1}, metadata !127), !dbg !128
  call void @llvm.dbg.declare(metadata !{i32* %i2}, metadata !129), !dbg !128
  call void @llvm.dbg.declare(metadata !{i32* %i3}, metadata !130), !dbg !128
  call void @llvm.dbg.declare(metadata !{i32* %i2rev}, metadata !131), !dbg !132
  call void @llvm.dbg.declare(metadata !{i32* %i3rev}, metadata !133), !dbg !132
  call void @llvm.dbg.declare(metadata !{i32* %ip1}, metadata !134), !dbg !132
  call void @llvm.dbg.declare(metadata !{i32* %ip2}, metadata !135), !dbg !132
  call void @llvm.dbg.declare(metadata !{i32* %ip3}, metadata !136), !dbg !132
  call void @llvm.dbg.declare(metadata !{i32* %ifp1}, metadata !137), !dbg !132
  call void @llvm.dbg.declare(metadata !{i32* %ifp2}, metadata !138), !dbg !132
  call void @llvm.dbg.declare(metadata !{i32* %ibit}, metadata !139), !dbg !140
  call void @llvm.dbg.declare(metadata !{i32* %idim}, metadata !141), !dbg !140
  call void @llvm.dbg.declare(metadata !{i32* %k1}, metadata !142), !dbg !140
  call void @llvm.dbg.declare(metadata !{i32* %k2}, metadata !143), !dbg !140
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !144), !dbg !140
  call void @llvm.dbg.declare(metadata !{i32* %nprev}, metadata !145), !dbg !140
  call void @llvm.dbg.declare(metadata !{i32* %nrem}, metadata !146), !dbg !140
  call void @llvm.dbg.declare(metadata !{i32* %ntot}, metadata !147), !dbg !140
  call void @llvm.dbg.declare(metadata !{double* %tempi}, metadata !148), !dbg !149
  call void @llvm.dbg.declare(metadata !{double* %tempr}, metadata !150), !dbg !149
  call void @llvm.dbg.declare(metadata !{double* %theta}, metadata !151), !dbg !152
  call void @llvm.dbg.declare(metadata !{double* %wi}, metadata !153), !dbg !152
  call void @llvm.dbg.declare(metadata !{double* %wpi}, metadata !154), !dbg !152
  call void @llvm.dbg.declare(metadata !{double* %wpr}, metadata !155), !dbg !152
  call void @llvm.dbg.declare(metadata !{double* %wr}, metadata !156), !dbg !152
  call void @llvm.dbg.declare(metadata !{double* %wtemp}, metadata !157), !dbg !152
  store i32 1, i32* %ntot, align 4, !dbg !158
  store i32 1, i32* %idim, align 4, !dbg !159
  br label %5, !dbg !159

; <label>:5                                       ; preds = %17, %0
  %6 = load i32* %idim, align 4, !dbg !159
  %7 = load i32* %3, align 4, !dbg !159
  %8 = icmp sle i32 %6, %7, !dbg !159
  br i1 %8, label %9, label %20, !dbg !159

; <label>:9                                       ; preds = %5
  %10 = load i32* %idim, align 4, !dbg !161
  %11 = sext i32 %10 to i64, !dbg !161
  %12 = load i32** %2, align 8, !dbg !161
  %13 = getelementptr inbounds i32* %12, i64 %11, !dbg !161
  %14 = load i32* %13, align 4, !dbg !161
  %15 = load i32* %ntot, align 4, !dbg !161
  %16 = mul nsw i32 %15, %14, !dbg !161
  store i32 %16, i32* %ntot, align 4, !dbg !161
  br label %17, !dbg !161

; <label>:17                                      ; preds = %9
  %18 = load i32* %idim, align 4, !dbg !159
  %19 = add nsw i32 %18, 1, !dbg !159
  store i32 %19, i32* %idim, align 4, !dbg !159
  br label %5, !dbg !159

; <label>:20                                      ; preds = %5
  store i32 1, i32* %nprev, align 4, !dbg !162
  %21 = load i32* %3, align 4, !dbg !163
  store i32 %21, i32* %idim, align 4, !dbg !163
  br label %22, !dbg !163

; <label>:22                                      ; preds = %309, %20
  %23 = load i32* %idim, align 4, !dbg !163
  %24 = icmp sge i32 %23, 1, !dbg !163
  br i1 %24, label %25, label %312, !dbg !163

; <label>:25                                      ; preds = %22
  %26 = load i32* %idim, align 4, !dbg !165
  %27 = sext i32 %26 to i64, !dbg !165
  %28 = load i32** %2, align 8, !dbg !165
  %29 = getelementptr inbounds i32* %28, i64 %27, !dbg !165
  %30 = load i32* %29, align 4, !dbg !165
  store i32 %30, i32* %n, align 4, !dbg !165
  %31 = load i32* %ntot, align 4, !dbg !167
  %32 = load i32* %n, align 4, !dbg !167
  %33 = load i32* %nprev, align 4, !dbg !167
  %34 = mul nsw i32 %32, %33, !dbg !167
  %35 = sdiv i32 %31, %34, !dbg !167
  store i32 %35, i32* %nrem, align 4, !dbg !167
  %36 = load i32* %nprev, align 4, !dbg !168
  %37 = shl i32 %36, 1, !dbg !168
  store i32 %37, i32* %ip1, align 4, !dbg !168
  %38 = load i32* %ip1, align 4, !dbg !169
  %39 = load i32* %n, align 4, !dbg !169
  %40 = mul nsw i32 %38, %39, !dbg !169
  store i32 %40, i32* %ip2, align 4, !dbg !169
  %41 = load i32* %ip2, align 4, !dbg !170
  %42 = load i32* %nrem, align 4, !dbg !170
  %43 = mul nsw i32 %41, %42, !dbg !170
  store i32 %43, i32* %ip3, align 4, !dbg !170
  store i32 1, i32* %i2rev, align 4, !dbg !171
  store i32 1, i32* %i2, align 4, !dbg !172
  br label %44, !dbg !172

; <label>:44                                      ; preds = %147, %25
  %45 = load i32* %i2, align 4, !dbg !172
  %46 = load i32* %ip2, align 4, !dbg !172
  %47 = icmp sle i32 %45, %46, !dbg !172
  br i1 %47, label %48, label %151, !dbg !172

; <label>:48                                      ; preds = %44
  %49 = load i32* %i2, align 4, !dbg !174
  %50 = load i32* %i2rev, align 4, !dbg !174
  %51 = icmp slt i32 %49, %50, !dbg !174
  br i1 %51, label %52, label %124, !dbg !174

; <label>:52                                      ; preds = %48
  %53 = load i32* %i2, align 4, !dbg !177
  store i32 %53, i32* %i1, align 4, !dbg !177
  br label %54, !dbg !177

; <label>:54                                      ; preds = %120, %52
  %55 = load i32* %i1, align 4, !dbg !177
  %56 = load i32* %i2, align 4, !dbg !177
  %57 = load i32* %ip1, align 4, !dbg !177
  %58 = add nsw i32 %56, %57, !dbg !177
  %59 = sub nsw i32 %58, 2, !dbg !177
  %60 = icmp sle i32 %55, %59, !dbg !177
  br i1 %60, label %61, label %123, !dbg !177

; <label>:61                                      ; preds = %54
  %62 = load i32* %i1, align 4, !dbg !180
  store i32 %62, i32* %i3, align 4, !dbg !180
  br label %63, !dbg !180

; <label>:63                                      ; preds = %115, %61
  %64 = load i32* %i3, align 4, !dbg !180
  %65 = load i32* %ip3, align 4, !dbg !180
  %66 = icmp sle i32 %64, %65, !dbg !180
  br i1 %66, label %67, label %119, !dbg !180

; <label>:67                                      ; preds = %63
  %68 = load i32* %i2rev, align 4, !dbg !183
  %69 = load i32* %i3, align 4, !dbg !183
  %70 = add nsw i32 %68, %69, !dbg !183
  %71 = load i32* %i2, align 4, !dbg !183
  %72 = sub nsw i32 %70, %71, !dbg !183
  store i32 %72, i32* %i3rev, align 4, !dbg !183
  %73 = load i32* %i3, align 4, !dbg !185
  %74 = sext i32 %73 to i64, !dbg !185
  %75 = load double** %1, align 8, !dbg !185
  %76 = getelementptr inbounds double* %75, i64 %74, !dbg !185
  %77 = load double* %76, align 8, !dbg !185
  store double %77, double* %tempr, align 8, !dbg !185
  %78 = load i32* %i3rev, align 4, !dbg !185
  %79 = sext i32 %78 to i64, !dbg !185
  %80 = load double** %1, align 8, !dbg !185
  %81 = getelementptr inbounds double* %80, i64 %79, !dbg !185
  %82 = load double* %81, align 8, !dbg !185
  %83 = load i32* %i3, align 4, !dbg !185
  %84 = sext i32 %83 to i64, !dbg !185
  %85 = load double** %1, align 8, !dbg !185
  %86 = getelementptr inbounds double* %85, i64 %84, !dbg !185
  store double %82, double* %86, align 8, !dbg !185
  %87 = load double* %tempr, align 8, !dbg !185
  %88 = load i32* %i3rev, align 4, !dbg !185
  %89 = sext i32 %88 to i64, !dbg !185
  %90 = load double** %1, align 8, !dbg !185
  %91 = getelementptr inbounds double* %90, i64 %89, !dbg !185
  store double %87, double* %91, align 8, !dbg !185
  %92 = load i32* %i3, align 4, !dbg !186
  %93 = add nsw i32 %92, 1, !dbg !186
  %94 = sext i32 %93 to i64, !dbg !186
  %95 = load double** %1, align 8, !dbg !186
  %96 = getelementptr inbounds double* %95, i64 %94, !dbg !186
  %97 = load double* %96, align 8, !dbg !186
  store double %97, double* %tempr, align 8, !dbg !186
  %98 = load i32* %i3rev, align 4, !dbg !186
  %99 = add nsw i32 %98, 1, !dbg !186
  %100 = sext i32 %99 to i64, !dbg !186
  %101 = load double** %1, align 8, !dbg !186
  %102 = getelementptr inbounds double* %101, i64 %100, !dbg !186
  %103 = load double* %102, align 8, !dbg !186
  %104 = load i32* %i3, align 4, !dbg !186
  %105 = add nsw i32 %104, 1, !dbg !186
  %106 = sext i32 %105 to i64, !dbg !186
  %107 = load double** %1, align 8, !dbg !186
  %108 = getelementptr inbounds double* %107, i64 %106, !dbg !186
  store double %103, double* %108, align 8, !dbg !186
  %109 = load double* %tempr, align 8, !dbg !186
  %110 = load i32* %i3rev, align 4, !dbg !186
  %111 = add nsw i32 %110, 1, !dbg !186
  %112 = sext i32 %111 to i64, !dbg !186
  %113 = load double** %1, align 8, !dbg !186
  %114 = getelementptr inbounds double* %113, i64 %112, !dbg !186
  store double %109, double* %114, align 8, !dbg !186
  br label %115, !dbg !187

; <label>:115                                     ; preds = %67
  %116 = load i32* %ip2, align 4, !dbg !180
  %117 = load i32* %i3, align 4, !dbg !180
  %118 = add nsw i32 %117, %116, !dbg !180
  store i32 %118, i32* %i3, align 4, !dbg !180
  br label %63, !dbg !180

; <label>:119                                     ; preds = %63
  br label %120, !dbg !188

; <label>:120                                     ; preds = %119
  %121 = load i32* %i1, align 4, !dbg !177
  %122 = add nsw i32 %121, 2, !dbg !177
  store i32 %122, i32* %i1, align 4, !dbg !177
  br label %54, !dbg !177

; <label>:123                                     ; preds = %54
  br label %124, !dbg !189

; <label>:124                                     ; preds = %123, %48
  %125 = load i32* %ip2, align 4, !dbg !190
  %126 = ashr i32 %125, 1, !dbg !190
  store i32 %126, i32* %ibit, align 4, !dbg !190
  br label %127, !dbg !191

; <label>:127                                     ; preds = %137, %124
  %128 = load i32* %ibit, align 4, !dbg !191
  %129 = load i32* %ip1, align 4, !dbg !191
  %130 = icmp sge i32 %128, %129, !dbg !191
  br i1 %130, label %131, label %135, !dbg !191

; <label>:131                                     ; preds = %127
  %132 = load i32* %i2rev, align 4, !dbg !191
  %133 = load i32* %ibit, align 4, !dbg !191
  %134 = icmp sgt i32 %132, %133, !dbg !191
  br label %135

; <label>:135                                     ; preds = %131, %127
  %136 = phi i1 [ false, %127 ], [ %134, %131 ]
  br i1 %136, label %137, label %143

; <label>:137                                     ; preds = %135
  %138 = load i32* %ibit, align 4, !dbg !192
  %139 = load i32* %i2rev, align 4, !dbg !192
  %140 = sub nsw i32 %139, %138, !dbg !192
  store i32 %140, i32* %i2rev, align 4, !dbg !192
  %141 = load i32* %ibit, align 4, !dbg !194
  %142 = ashr i32 %141, 1, !dbg !194
  store i32 %142, i32* %ibit, align 4, !dbg !194
  br label %127, !dbg !195

; <label>:143                                     ; preds = %135
  %144 = load i32* %ibit, align 4, !dbg !196
  %145 = load i32* %i2rev, align 4, !dbg !196
  %146 = add nsw i32 %145, %144, !dbg !196
  store i32 %146, i32* %i2rev, align 4, !dbg !196
  br label %147, !dbg !197

; <label>:147                                     ; preds = %143
  %148 = load i32* %ip1, align 4, !dbg !172
  %149 = load i32* %i2, align 4, !dbg !172
  %150 = add nsw i32 %149, %148, !dbg !172
  store i32 %150, i32* %i2, align 4, !dbg !172
  br label %44, !dbg !172

; <label>:151                                     ; preds = %44
  %152 = load i32* %ip1, align 4, !dbg !198
  store i32 %152, i32* %ifp1, align 4, !dbg !198
  br label %153, !dbg !199

; <label>:153                                     ; preds = %303, %151
  %154 = load i32* %ifp1, align 4, !dbg !199
  %155 = load i32* %ip2, align 4, !dbg !199
  %156 = icmp slt i32 %154, %155, !dbg !199
  br i1 %156, label %157, label %305, !dbg !199

; <label>:157                                     ; preds = %153
  %158 = load i32* %ifp1, align 4, !dbg !200
  %159 = shl i32 %158, 1, !dbg !200
  store i32 %159, i32* %ifp2, align 4, !dbg !200
  %160 = load i32* %4, align 4, !dbg !202
  %161 = sitofp i32 %160 to double, !dbg !202
  %162 = fmul double %161, 0x401921FB54442D1C, !dbg !202
  %163 = load i32* %ifp2, align 4, !dbg !202
  %164 = load i32* %ip1, align 4, !dbg !202
  %165 = sdiv i32 %163, %164, !dbg !202
  %166 = sitofp i32 %165 to double, !dbg !202
  %167 = fdiv double %162, %166, !dbg !202
  store double %167, double* %theta, align 8, !dbg !202
  %168 = load double* %theta, align 8, !dbg !203
  %169 = fmul double 5.000000e-01, %168, !dbg !203
  %170 = call double @sin(double %169) #5, !dbg !203
  store double %170, double* %wtemp, align 8, !dbg !203
  %171 = load double* %wtemp, align 8, !dbg !204
  %172 = fmul double -2.000000e+00, %171, !dbg !204
  %173 = load double* %wtemp, align 8, !dbg !204
  %174 = fmul double %172, %173, !dbg !204
  store double %174, double* %wpr, align 8, !dbg !204
  %175 = load double* %theta, align 8, !dbg !205
  %176 = call double @sin(double %175) #5, !dbg !205
  store double %176, double* %wpi, align 8, !dbg !205
  store double 1.000000e+00, double* %wr, align 8, !dbg !206
  store double 0.000000e+00, double* %wi, align 8, !dbg !207
  store i32 1, i32* %i3, align 4, !dbg !208
  br label %177, !dbg !208

; <label>:177                                     ; preds = %299, %157
  %178 = load i32* %i3, align 4, !dbg !208
  %179 = load i32* %ifp1, align 4, !dbg !208
  %180 = icmp sle i32 %178, %179, !dbg !208
  br i1 %180, label %181, label %303, !dbg !208

; <label>:181                                     ; preds = %177
  %182 = load i32* %i3, align 4, !dbg !210
  store i32 %182, i32* %i1, align 4, !dbg !210
  br label %183, !dbg !210

; <label>:183                                     ; preds = %277, %181
  %184 = load i32* %i1, align 4, !dbg !210
  %185 = load i32* %i3, align 4, !dbg !210
  %186 = load i32* %ip1, align 4, !dbg !210
  %187 = add nsw i32 %185, %186, !dbg !210
  %188 = sub nsw i32 %187, 2, !dbg !210
  %189 = icmp sle i32 %184, %188, !dbg !210
  br i1 %189, label %190, label %280, !dbg !210

; <label>:190                                     ; preds = %183
  %191 = load i32* %i1, align 4, !dbg !213
  store i32 %191, i32* %i2, align 4, !dbg !213
  br label %192, !dbg !213

; <label>:192                                     ; preds = %272, %190
  %193 = load i32* %i2, align 4, !dbg !213
  %194 = load i32* %ip3, align 4, !dbg !213
  %195 = icmp sle i32 %193, %194, !dbg !213
  br i1 %195, label %196, label %276, !dbg !213

; <label>:196                                     ; preds = %192
  %197 = load i32* %i2, align 4, !dbg !216
  store i32 %197, i32* %k1, align 4, !dbg !216
  %198 = load i32* %k1, align 4, !dbg !218
  %199 = load i32* %ifp1, align 4, !dbg !218
  %200 = add nsw i32 %198, %199, !dbg !218
  store i32 %200, i32* %k2, align 4, !dbg !218
  %201 = load double* %wr, align 8, !dbg !219
  %202 = load i32* %k2, align 4, !dbg !219
  %203 = sext i32 %202 to i64, !dbg !219
  %204 = load double** %1, align 8, !dbg !219
  %205 = getelementptr inbounds double* %204, i64 %203, !dbg !219
  %206 = load double* %205, align 8, !dbg !219
  %207 = fmul double %201, %206, !dbg !219
  %208 = load double* %wi, align 8, !dbg !219
  %209 = load i32* %k2, align 4, !dbg !219
  %210 = add nsw i32 %209, 1, !dbg !219
  %211 = sext i32 %210 to i64, !dbg !219
  %212 = load double** %1, align 8, !dbg !219
  %213 = getelementptr inbounds double* %212, i64 %211, !dbg !219
  %214 = load double* %213, align 8, !dbg !219
  %215 = fmul double %208, %214, !dbg !219
  %216 = fsub double %207, %215, !dbg !219
  store double %216, double* %tempr, align 8, !dbg !219
  %217 = load double* %wr, align 8, !dbg !220
  %218 = load i32* %k2, align 4, !dbg !220
  %219 = add nsw i32 %218, 1, !dbg !220
  %220 = sext i32 %219 to i64, !dbg !220
  %221 = load double** %1, align 8, !dbg !220
  %222 = getelementptr inbounds double* %221, i64 %220, !dbg !220
  %223 = load double* %222, align 8, !dbg !220
  %224 = fmul double %217, %223, !dbg !220
  %225 = load double* %wi, align 8, !dbg !220
  %226 = load i32* %k2, align 4, !dbg !220
  %227 = sext i32 %226 to i64, !dbg !220
  %228 = load double** %1, align 8, !dbg !220
  %229 = getelementptr inbounds double* %228, i64 %227, !dbg !220
  %230 = load double* %229, align 8, !dbg !220
  %231 = fmul double %225, %230, !dbg !220
  %232 = fadd double %224, %231, !dbg !220
  store double %232, double* %tempi, align 8, !dbg !220
  %233 = load i32* %k1, align 4, !dbg !221
  %234 = sext i32 %233 to i64, !dbg !221
  %235 = load double** %1, align 8, !dbg !221
  %236 = getelementptr inbounds double* %235, i64 %234, !dbg !221
  %237 = load double* %236, align 8, !dbg !221
  %238 = load double* %tempr, align 8, !dbg !221
  %239 = fsub double %237, %238, !dbg !221
  %240 = load i32* %k2, align 4, !dbg !221
  %241 = sext i32 %240 to i64, !dbg !221
  %242 = load double** %1, align 8, !dbg !221
  %243 = getelementptr inbounds double* %242, i64 %241, !dbg !221
  store double %239, double* %243, align 8, !dbg !221
  %244 = load i32* %k1, align 4, !dbg !222
  %245 = add nsw i32 %244, 1, !dbg !222
  %246 = sext i32 %245 to i64, !dbg !222
  %247 = load double** %1, align 8, !dbg !222
  %248 = getelementptr inbounds double* %247, i64 %246, !dbg !222
  %249 = load double* %248, align 8, !dbg !222
  %250 = load double* %tempi, align 8, !dbg !222
  %251 = fsub double %249, %250, !dbg !222
  %252 = load i32* %k2, align 4, !dbg !222
  %253 = add nsw i32 %252, 1, !dbg !222
  %254 = sext i32 %253 to i64, !dbg !222
  %255 = load double** %1, align 8, !dbg !222
  %256 = getelementptr inbounds double* %255, i64 %254, !dbg !222
  store double %251, double* %256, align 8, !dbg !222
  %257 = load double* %tempr, align 8, !dbg !223
  %258 = load i32* %k1, align 4, !dbg !223
  %259 = sext i32 %258 to i64, !dbg !223
  %260 = load double** %1, align 8, !dbg !223
  %261 = getelementptr inbounds double* %260, i64 %259, !dbg !223
  %262 = load double* %261, align 8, !dbg !223
  %263 = fadd double %262, %257, !dbg !223
  store double %263, double* %261, align 8, !dbg !223
  %264 = load double* %tempi, align 8, !dbg !224
  %265 = load i32* %k1, align 4, !dbg !224
  %266 = add nsw i32 %265, 1, !dbg !224
  %267 = sext i32 %266 to i64, !dbg !224
  %268 = load double** %1, align 8, !dbg !224
  %269 = getelementptr inbounds double* %268, i64 %267, !dbg !224
  %270 = load double* %269, align 8, !dbg !224
  %271 = fadd double %270, %264, !dbg !224
  store double %271, double* %269, align 8, !dbg !224
  br label %272, !dbg !225

; <label>:272                                     ; preds = %196
  %273 = load i32* %ifp2, align 4, !dbg !213
  %274 = load i32* %i2, align 4, !dbg !213
  %275 = add nsw i32 %274, %273, !dbg !213
  store i32 %275, i32* %i2, align 4, !dbg !213
  br label %192, !dbg !213

; <label>:276                                     ; preds = %192
  br label %277, !dbg !226

; <label>:277                                     ; preds = %276
  %278 = load i32* %i1, align 4, !dbg !210
  %279 = add nsw i32 %278, 2, !dbg !210
  store i32 %279, i32* %i1, align 4, !dbg !210
  br label %183, !dbg !210

; <label>:280                                     ; preds = %183
  %281 = load double* %wr, align 8, !dbg !227
  store double %281, double* %wtemp, align 8, !dbg !227
  %282 = load double* %wpr, align 8, !dbg !227
  %283 = fmul double %281, %282, !dbg !227
  %284 = load double* %wi, align 8, !dbg !227
  %285 = load double* %wpi, align 8, !dbg !227
  %286 = fmul double %284, %285, !dbg !227
  %287 = fsub double %283, %286, !dbg !227
  %288 = load double* %wr, align 8, !dbg !227
  %289 = fadd double %287, %288, !dbg !227
  store double %289, double* %wr, align 8, !dbg !227
  %290 = load double* %wi, align 8, !dbg !228
  %291 = load double* %wpr, align 8, !dbg !228
  %292 = fmul double %290, %291, !dbg !228
  %293 = load double* %wtemp, align 8, !dbg !228
  %294 = load double* %wpi, align 8, !dbg !228
  %295 = fmul double %293, %294, !dbg !228
  %296 = fadd double %292, %295, !dbg !228
  %297 = load double* %wi, align 8, !dbg !228
  %298 = fadd double %296, %297, !dbg !228
  store double %298, double* %wi, align 8, !dbg !228
  br label %299, !dbg !229

; <label>:299                                     ; preds = %280
  %300 = load i32* %ip1, align 4, !dbg !208
  %301 = load i32* %i3, align 4, !dbg !208
  %302 = add nsw i32 %301, %300, !dbg !208
  store i32 %302, i32* %i3, align 4, !dbg !208
  br label %177, !dbg !208

; <label>:303                                     ; preds = %177
  %304 = load i32* %ifp2, align 4, !dbg !230
  store i32 %304, i32* %ifp1, align 4, !dbg !230
  br label %153, !dbg !231

; <label>:305                                     ; preds = %153
  %306 = load i32* %n, align 4, !dbg !232
  %307 = load i32* %nprev, align 4, !dbg !232
  %308 = mul nsw i32 %307, %306, !dbg !232
  store i32 %308, i32* %nprev, align 4, !dbg !232
  br label %309, !dbg !233

; <label>:309                                     ; preds = %305
  %310 = load i32* %idim, align 4, !dbg !163
  %311 = add nsw i32 %310, -1, !dbg !163
  store i32 %311, i32* %idim, align 4, !dbg !163
  br label %22, !dbg !163

; <label>:312                                     ; preds = %22
  ret void, !dbg !234
}

; Function Attrs: nounwind
declare double @sin(double) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!20, !21}
!llvm.ident = !{!22}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !15, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c] [DW_LANG_C99]
!1 = metadata !{metadata !"ffbench.c", metadata !"/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base"}
!2 = metadata !{}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 227, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 228} ; [ DW_TAG_subprogram ] [line 227] [def] [scope 228] [main]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fourn", metadata !"fourn", metadata !"", i32 157, metadata !10, i1 true, i1 true, i32 0, i32 0, null, i32 0, i1 false, void (double*, i32*, i32, i32)* @fourn, null, null, metadata !2, i32 160} ; [ DW_TAG_subprogram ] [line 157] [local] [def] [scope 160] [fourn]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{null, metadata !12, metadata !14, metadata !8, metadata !8}
!12 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!13 = metadata !{i32 786468, null, null, metadata !"double", i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!14 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!15 = metadata !{metadata !16}
!16 = metadata !{i32 786484, i32 0, metadata !4, metadata !"nsize", metadata !"nsize", metadata !"", metadata !5, i32 231, metadata !17, i32 1, i32 1, [3 x i32]* @main.nsize, null} ; [ DW_TAG_variable ] [nsize] [line 231] [local] [def]
!17 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 96, i64 32, i32 0, i32 0, metadata !8, metadata !18, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from int]
!18 = metadata !{metadata !19}
!19 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!20 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!21 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!22 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
!23 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !5, i32 229, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 229]
!24 = metadata !{i32 229, i32 0, metadata !4, null}
!25 = metadata !{i32 786688, metadata !4, metadata !"j", metadata !5, i32 229, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 229]
!26 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !5, i32 229, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 229]
!27 = metadata !{i32 786688, metadata !4, metadata !"l", metadata !5, i32 229, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 229]
!28 = metadata !{i32 786688, metadata !4, metadata !"m", metadata !5, i32 229, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 229]
!29 = metadata !{i32 786688, metadata !4, metadata !"npasses", metadata !5, i32 229, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [npasses] [line 229]
!30 = metadata !{i32 786688, metadata !4, metadata !"faedge", metadata !5, i32 229, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [faedge] [line 229]
!31 = metadata !{i32 786688, metadata !4, metadata !"fdata", metadata !5, i32 230, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fdata] [line 230]
!32 = metadata !{i32 230, i32 0, metadata !4, null}
!33 = metadata !{i32 786688, metadata !4, metadata !"fanum", metadata !5, i32 232, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fanum] [line 232]
!34 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!35 = metadata !{i32 232, i32 0, metadata !4, null}
!36 = metadata !{i32 786688, metadata !4, metadata !"fasize", metadata !5, i32 232, metadata !34, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fasize] [line 232]
!37 = metadata !{i32 786688, metadata !4, metadata !"mapbase", metadata !5, i32 233, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mapbase] [line 233]
!38 = metadata !{i32 233, i32 0, metadata !4, null}
!39 = metadata !{i32 786688, metadata !4, metadata !"mapscale", metadata !5, i32 233, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mapscale] [line 233]
!40 = metadata !{i32 786688, metadata !4, metadata !"rmin", metadata !5, i32 233, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rmin] [line 233]
!41 = metadata !{i32 786688, metadata !4, metadata !"rmax", metadata !5, i32 233, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rmax] [line 233]
!42 = metadata !{i32 786688, metadata !4, metadata !"imin", metadata !5, i32 233, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [imin] [line 233]
!43 = metadata !{i32 786688, metadata !4, metadata !"imax", metadata !5, i32 233, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [imax] [line 233]
!44 = metadata !{i32 235, i32 0, metadata !4, null}
!45 = metadata !{i32 236, i32 0, metadata !4, null}
!46 = metadata !{i32 237, i32 0, metadata !4, null}
!47 = metadata !{i32 238, i32 0, metadata !4, null}
!48 = metadata !{i32 240, i32 0, metadata !4, null}
!49 = metadata !{i32 241, i32 0, metadata !50, null}
!50 = metadata !{i32 786443, metadata !1, metadata !4, i32 241, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!51 = metadata !{i32 242, i32 0, metadata !52, null}
!52 = metadata !{i32 786443, metadata !1, metadata !50, i32 241, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!53 = metadata !{i32 243, i32 0, metadata !52, null}
!54 = metadata !{i32 251, i32 0, metadata !4, null}
!55 = metadata !{i32 252, i32 0, metadata !56, null}
!56 = metadata !{i32 786443, metadata !1, metadata !4, i32 252, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!57 = metadata !{i32 253, i32 0, metadata !58, null}
!58 = metadata !{i32 786443, metadata !1, metadata !59, i32 253, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!59 = metadata !{i32 786443, metadata !1, metadata !56, i32 252, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!60 = metadata !{i32 254, i32 0, metadata !61, null}
!61 = metadata !{i32 786443, metadata !1, metadata !62, i32 254, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!62 = metadata !{i32 786443, metadata !1, metadata !58, i32 253, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!63 = metadata !{i32 255, i32 0, metadata !61, null}
!64 = metadata !{i32 256, i32 0, metadata !62, null}
!65 = metadata !{i32 257, i32 0, metadata !59, null}
!66 = metadata !{i32 259, i32 0, metadata !67, null}
!67 = metadata !{i32 786443, metadata !1, metadata !4, i32 259, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!68 = metadata !{i32 262, i32 0, metadata !69, null}
!69 = metadata !{i32 786443, metadata !1, metadata !67, i32 259, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!70 = metadata !{i32 265, i32 0, metadata !69, null}
!71 = metadata !{i32 266, i32 0, metadata !69, null}
!72 = metadata !{i32 786688, metadata !73, metadata !"r", metadata !5, i32 269, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 269]
!73 = metadata !{i32 786443, metadata !1, metadata !4, i32 268, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!74 = metadata !{i32 269, i32 0, metadata !73, null}
!75 = metadata !{i32 786688, metadata !73, metadata !"ij", metadata !5, i32 269, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ij] [line 269]
!76 = metadata !{i32 786688, metadata !73, metadata !"ar", metadata !5, i32 269, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ar] [line 269]
!77 = metadata !{i32 786688, metadata !73, metadata !"ai", metadata !5, i32 269, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ai] [line 269]
!78 = metadata !{i32 270, i32 0, metadata !73, null}
!79 = metadata !{i32 271, i32 0, metadata !73, null}
!80 = metadata !{i32 272, i32 0, metadata !73, null}
!81 = metadata !{i32 273, i32 0, metadata !73, null}
!82 = metadata !{i32 275, i32 0, metadata !83, null}
!83 = metadata !{i32 786443, metadata !1, metadata !73, i32 275, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!84 = metadata !{i32 276, i32 0, metadata !85, null}
!85 = metadata !{i32 786443, metadata !1, metadata !83, i32 275, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!86 = metadata !{i32 277, i32 0, metadata !85, null}
!87 = metadata !{i32 278, i32 0, metadata !85, null}
!88 = metadata !{i32 279, i32 0, metadata !85, null}
!89 = metadata !{i32 280, i32 0, metadata !85, null}
!90 = metadata !{i32 281, i32 0, metadata !85, null}
!91 = metadata !{i32 282, i32 0, metadata !85, null}
!92 = metadata !{i32 283, i32 0, metadata !85, null}
!93 = metadata !{i32 284, i32 0, metadata !85, null}
!94 = metadata !{i32 291, i32 0, metadata !73, null}
!95 = metadata !{i32 292, i32 0, metadata !73, null}
!96 = metadata !{i32 297, i32 0, metadata !4, null}
!97 = metadata !{i32 298, i32 0, metadata !98, null}
!98 = metadata !{i32 786443, metadata !1, metadata !4, i32 298, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!99 = metadata !{i32 299, i32 0, metadata !100, null}
!100 = metadata !{i32 786443, metadata !1, metadata !101, i32 299, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!101 = metadata !{i32 786443, metadata !1, metadata !98, i32 298, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!102 = metadata !{i32 300, i32 0, metadata !103, null}
!103 = metadata !{i32 786443, metadata !1, metadata !100, i32 299, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!104 = metadata !{i32 301, i32 0, metadata !103, null}
!105 = metadata !{i32 302, i32 0, metadata !106, null}
!106 = metadata !{i32 786443, metadata !1, metadata !103, i32 302, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!107 = metadata !{i32 303, i32 0, metadata !108, null}
!108 = metadata !{i32 786443, metadata !1, metadata !106, i32 302, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!109 = metadata !{i32 304, i32 0, metadata !108, null}
!110 = metadata !{i32 307, i32 0, metadata !108, null}
!111 = metadata !{i32 308, i32 0, metadata !103, null}
!112 = metadata !{i32 309, i32 0, metadata !101, null}
!113 = metadata !{i32 310, i32 0, metadata !114, null}
!114 = metadata !{i32 786443, metadata !1, metadata !4, i32 310, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!115 = metadata !{i32 311, i32 0, metadata !116, null}
!116 = metadata !{i32 786443, metadata !1, metadata !114, i32 310, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!117 = metadata !{i32 312, i32 0, metadata !116, null}
!118 = metadata !{i32 313, i32 0, metadata !119, null}
!119 = metadata !{i32 786443, metadata !1, metadata !114, i32 312, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!120 = metadata !{i32 360, i32 0, metadata !4, null}
!121 = metadata !{i32 786689, metadata !9, metadata !"data", metadata !5, i32 16777374, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [data] [line 158]
!122 = metadata !{i32 158, i32 0, metadata !9, null}
!123 = metadata !{i32 786689, metadata !9, metadata !"nn", metadata !5, i32 33554591, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nn] [line 159]
!124 = metadata !{i32 159, i32 0, metadata !9, null}
!125 = metadata !{i32 786689, metadata !9, metadata !"ndim", metadata !5, i32 50331807, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ndim] [line 159]
!126 = metadata !{i32 786689, metadata !9, metadata !"isign", metadata !5, i32 67109023, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [isign] [line 159]
!127 = metadata !{i32 786688, metadata !9, metadata !"i1", metadata !5, i32 161, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i1] [line 161]
!128 = metadata !{i32 161, i32 0, metadata !9, null}
!129 = metadata !{i32 786688, metadata !9, metadata !"i2", metadata !5, i32 161, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i2] [line 161]
!130 = metadata !{i32 786688, metadata !9, metadata !"i3", metadata !5, i32 161, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i3] [line 161]
!131 = metadata !{i32 786688, metadata !9, metadata !"i2rev", metadata !5, i32 162, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i2rev] [line 162]
!132 = metadata !{i32 162, i32 0, metadata !9, null}
!133 = metadata !{i32 786688, metadata !9, metadata !"i3rev", metadata !5, i32 162, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i3rev] [line 162]
!134 = metadata !{i32 786688, metadata !9, metadata !"ip1", metadata !5, i32 162, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ip1] [line 162]
!135 = metadata !{i32 786688, metadata !9, metadata !"ip2", metadata !5, i32 162, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ip2] [line 162]
!136 = metadata !{i32 786688, metadata !9, metadata !"ip3", metadata !5, i32 162, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ip3] [line 162]
!137 = metadata !{i32 786688, metadata !9, metadata !"ifp1", metadata !5, i32 162, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ifp1] [line 162]
!138 = metadata !{i32 786688, metadata !9, metadata !"ifp2", metadata !5, i32 162, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ifp2] [line 162]
!139 = metadata !{i32 786688, metadata !9, metadata !"ibit", metadata !5, i32 163, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ibit] [line 163]
!140 = metadata !{i32 163, i32 0, metadata !9, null}
!141 = metadata !{i32 786688, metadata !9, metadata !"idim", metadata !5, i32 163, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idim] [line 163]
!142 = metadata !{i32 786688, metadata !9, metadata !"k1", metadata !5, i32 163, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k1] [line 163]
!143 = metadata !{i32 786688, metadata !9, metadata !"k2", metadata !5, i32 163, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k2] [line 163]
!144 = metadata !{i32 786688, metadata !9, metadata !"n", metadata !5, i32 163, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 163]
!145 = metadata !{i32 786688, metadata !9, metadata !"nprev", metadata !5, i32 163, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nprev] [line 163]
!146 = metadata !{i32 786688, metadata !9, metadata !"nrem", metadata !5, i32 163, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nrem] [line 163]
!147 = metadata !{i32 786688, metadata !9, metadata !"ntot", metadata !5, i32 163, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ntot] [line 163]
!148 = metadata !{i32 786688, metadata !9, metadata !"tempi", metadata !5, i32 164, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tempi] [line 164]
!149 = metadata !{i32 164, i32 0, metadata !9, null}
!150 = metadata !{i32 786688, metadata !9, metadata !"tempr", metadata !5, i32 164, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tempr] [line 164]
!151 = metadata !{i32 786688, metadata !9, metadata !"theta", metadata !5, i32 165, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [theta] [line 165]
!152 = metadata !{i32 165, i32 0, metadata !9, null}
!153 = metadata !{i32 786688, metadata !9, metadata !"wi", metadata !5, i32 165, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wi] [line 165]
!154 = metadata !{i32 786688, metadata !9, metadata !"wpi", metadata !5, i32 165, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wpi] [line 165]
!155 = metadata !{i32 786688, metadata !9, metadata !"wpr", metadata !5, i32 165, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wpr] [line 165]
!156 = metadata !{i32 786688, metadata !9, metadata !"wr", metadata !5, i32 165, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wr] [line 165]
!157 = metadata !{i32 786688, metadata !9, metadata !"wtemp", metadata !5, i32 165, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [wtemp] [line 165]
!158 = metadata !{i32 167, i32 0, metadata !9, null}
!159 = metadata !{i32 168, i32 0, metadata !160, null}
!160 = metadata !{i32 786443, metadata !1, metadata !9, i32 168, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!161 = metadata !{i32 169, i32 0, metadata !160, null}
!162 = metadata !{i32 170, i32 0, metadata !9, null}
!163 = metadata !{i32 171, i32 0, metadata !164, null}
!164 = metadata !{i32 786443, metadata !1, metadata !9, i32 171, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!165 = metadata !{i32 172, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !1, metadata !164, i32 171, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!167 = metadata !{i32 173, i32 0, metadata !166, null}
!168 = metadata !{i32 174, i32 0, metadata !166, null}
!169 = metadata !{i32 175, i32 0, metadata !166, null}
!170 = metadata !{i32 176, i32 0, metadata !166, null}
!171 = metadata !{i32 177, i32 0, metadata !166, null}
!172 = metadata !{i32 178, i32 0, metadata !173, null}
!173 = metadata !{i32 786443, metadata !1, metadata !166, i32 178, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!174 = metadata !{i32 179, i32 0, metadata !175, null}
!175 = metadata !{i32 786443, metadata !1, metadata !176, i32 179, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!176 = metadata !{i32 786443, metadata !1, metadata !173, i32 178, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!177 = metadata !{i32 180, i32 0, metadata !178, null}
!178 = metadata !{i32 786443, metadata !1, metadata !179, i32 180, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!179 = metadata !{i32 786443, metadata !1, metadata !175, i32 179, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!180 = metadata !{i32 181, i32 0, metadata !181, null}
!181 = metadata !{i32 786443, metadata !1, metadata !182, i32 181, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!182 = metadata !{i32 786443, metadata !1, metadata !178, i32 180, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!183 = metadata !{i32 182, i32 0, metadata !184, null}
!184 = metadata !{i32 786443, metadata !1, metadata !181, i32 181, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!185 = metadata !{i32 183, i32 0, metadata !184, null}
!186 = metadata !{i32 184, i32 0, metadata !184, null}
!187 = metadata !{i32 185, i32 0, metadata !184, null}
!188 = metadata !{i32 186, i32 0, metadata !182, null}
!189 = metadata !{i32 187, i32 0, metadata !179, null}
!190 = metadata !{i32 188, i32 0, metadata !176, null}
!191 = metadata !{i32 189, i32 0, metadata !176, null}
!192 = metadata !{i32 190, i32 0, metadata !193, null}
!193 = metadata !{i32 786443, metadata !1, metadata !176, i32 189, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!194 = metadata !{i32 191, i32 0, metadata !193, null}
!195 = metadata !{i32 192, i32 0, metadata !193, null}
!196 = metadata !{i32 193, i32 0, metadata !176, null}
!197 = metadata !{i32 194, i32 0, metadata !176, null}
!198 = metadata !{i32 195, i32 0, metadata !166, null}
!199 = metadata !{i32 196, i32 0, metadata !166, null}
!200 = metadata !{i32 197, i32 0, metadata !201, null}
!201 = metadata !{i32 786443, metadata !1, metadata !166, i32 196, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!202 = metadata !{i32 198, i32 0, metadata !201, null}
!203 = metadata !{i32 199, i32 0, metadata !201, null}
!204 = metadata !{i32 200, i32 0, metadata !201, null}
!205 = metadata !{i32 201, i32 0, metadata !201, null}
!206 = metadata !{i32 202, i32 0, metadata !201, null}
!207 = metadata !{i32 203, i32 0, metadata !201, null}
!208 = metadata !{i32 204, i32 0, metadata !209, null}
!209 = metadata !{i32 786443, metadata !1, metadata !201, i32 204, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!210 = metadata !{i32 205, i32 0, metadata !211, null}
!211 = metadata !{i32 786443, metadata !1, metadata !212, i32 205, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!212 = metadata !{i32 786443, metadata !1, metadata !209, i32 204, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!213 = metadata !{i32 206, i32 0, metadata !214, null}
!214 = metadata !{i32 786443, metadata !1, metadata !215, i32 206, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!215 = metadata !{i32 786443, metadata !1, metadata !211, i32 205, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!216 = metadata !{i32 207, i32 0, metadata !217, null}
!217 = metadata !{i32 786443, metadata !1, metadata !214, i32 206, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/llvm/projects/llvm-project/benchmarks/src/base/ffbench.c]
!218 = metadata !{i32 208, i32 0, metadata !217, null}
!219 = metadata !{i32 209, i32 0, metadata !217, null}
!220 = metadata !{i32 210, i32 0, metadata !217, null}
!221 = metadata !{i32 211, i32 0, metadata !217, null}
!222 = metadata !{i32 212, i32 0, metadata !217, null}
!223 = metadata !{i32 213, i32 0, metadata !217, null}
!224 = metadata !{i32 214, i32 0, metadata !217, null}
!225 = metadata !{i32 215, i32 0, metadata !217, null}
!226 = metadata !{i32 216, i32 0, metadata !215, null}
!227 = metadata !{i32 217, i32 0, metadata !212, null}
!228 = metadata !{i32 218, i32 0, metadata !212, null}
!229 = metadata !{i32 219, i32 0, metadata !212, null}
!230 = metadata !{i32 220, i32 0, metadata !201, null}
!231 = metadata !{i32 221, i32 0, metadata !201, null}
!232 = metadata !{i32 222, i32 0, metadata !166, null}
!233 = metadata !{i32 223, i32 0, metadata !166, null}
!234 = metadata !{i32 224, i32 0, metadata !9, null}
