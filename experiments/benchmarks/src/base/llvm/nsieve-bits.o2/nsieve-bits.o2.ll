; ModuleID = 'nsieve-bits.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"Primes up to %8d %8d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !17, metadata !32), !dbg !33
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !18, metadata !32), !dbg !34
  tail call void @llvm.dbg.value(metadata i32 40960000, i64 0, metadata !20, metadata !32), !dbg !35
  %call = tail call noalias i8* @malloc(i64 5120004) #2, !dbg !36
  %0 = bitcast i8* %call to i32*, !dbg !37
  tail call void @llvm.dbg.value(metadata i32* %0, i64 0, metadata !21, metadata !32), !dbg !38
  %tobool = icmp eq i8* %call, null, !dbg !39
  br i1 %tobool, label %return, label %for.body8.lr.ph, !dbg !39

for.body8.lr.ph:                                  ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !27, metadata !32), !dbg !40
  tail call void @llvm.dbg.value(metadata i32 40960000, i64 0, metadata !28, metadata !32), !dbg !41
  tail call void @llvm.memset.p0i8.i64(i8* %call, i8 -1, i64 5120004, i32 4, i1 false), !dbg !42
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !22, metadata !32), !dbg !43
  br label %for.body8, !dbg !44

for.body8:                                        ; preds = %for.body8.lr.ph, %for.inc39
  %indvar85 = phi i32 [ 0, %for.body8.lr.ph ], [ %indvar.next86, %for.inc39 ]
  %count.076 = phi i32 [ 0, %for.body8.lr.ph ], [ %count.1, %for.inc39 ]
  %i.073 = phi i32 [ 2, %for.body8.lr.ph ], [ %inc40, %for.inc39 ]
  %1 = mul i32 %indvar85, -2, !dbg !46
  %2 = add i32 %1, 40959996, !dbg !46
  %3 = add i32 %indvar85, 2, !dbg !46
  %4 = udiv i32 %2, %3, !dbg !46
  %5 = add i32 %4, 1, !dbg !46
  %div = lshr i32 %i.073, 5, !dbg !46
  %div10 = zext i32 %div to i64, !dbg !46
  %arrayidx = getelementptr inbounds i32* %0, i64 %div10, !dbg !46
  %6 = load i32* %arrayidx, align 4, !dbg !46, !tbaa !49
  %7 = and i32 %i.073, 31, !dbg !46
  %shl = shl i32 1, %7, !dbg !46
  %and = and i32 %6, %shl, !dbg !46
  %tobool12 = icmp eq i32 %and, 0, !dbg !53
  br i1 %tobool12, label %for.inc39, label %if.then13, !dbg !53

if.then13:                                        ; preds = %for.body8
  %inc = add i32 %count.076, 1, !dbg !54
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !27, metadata !32), !dbg !40
  %add14 = shl i32 %i.073, 1, !dbg !56
  tail call void @llvm.dbg.value(metadata i32 %add14, i64 0, metadata !26, metadata !32), !dbg !58
  %cmp1670 = icmp ugt i32 %add14, 40960000, !dbg !59
  br i1 %cmp1670, label %for.inc39, label %for.body18.preheader, !dbg !61

for.body18.preheader:                             ; preds = %if.then13
  %xtraiter87 = and i32 %5, 1
  %lcmp.mod88 = icmp ne i32 %xtraiter87, 0
  %lcmp.overflow89 = icmp eq i32 %5, 0
  %lcmp.or90 = or i1 %lcmp.overflow89, %lcmp.mod88
  br i1 %lcmp.or90, label %for.body18.prol.preheader, label %for.body18.preheader.split

for.body18.prol.preheader:                        ; preds = %for.body18.preheader
  br label %for.body18.prol, !dbg !62

for.body18.prol:                                  ; preds = %for.body18.prol.preheader, %for.inc.prol
  %j.071.prol = phi i32 [ %add37.prol, %for.inc.prol ], [ %add14, %for.body18.prol.preheader ]
  %prol.iter91 = phi i32 [ %prol.iter91.sub, %for.inc.prol ], [ %xtraiter87, %for.body18.prol.preheader ]
  %div69.prol = lshr i32 %j.071.prol, 5, !dbg !62
  %div20.prol = zext i32 %div69.prol to i64, !dbg !62
  %arrayidx21.prol = getelementptr inbounds i32* %0, i64 %div20.prol, !dbg !62
  %8 = load i32* %arrayidx21.prol, align 4, !dbg !62, !tbaa !49
  %9 = and i32 %j.071.prol, 31, !dbg !62
  %shl25.prol = shl i32 1, %9, !dbg !62
  %and26.prol = and i32 %8, %shl25.prol, !dbg !62
  %tobool27.prol = icmp eq i32 %and26.prol, 0, !dbg !64
  br i1 %tobool27.prol, label %for.inc.prol, label %if.then28.prol, !dbg !64

if.then28.prol:                                   ; preds = %for.body18.prol
  %xor.prol = xor i32 %8, %shl25.prol, !dbg !65
  store i32 %xor.prol, i32* %arrayidx21.prol, align 4, !dbg !65, !tbaa !49
  br label %for.inc.prol, !dbg !65

for.inc.prol:                                     ; preds = %if.then28.prol, %for.body18.prol
  %add37.prol = add i32 %j.071.prol, %i.073, !dbg !67
  tail call void @llvm.dbg.value(metadata i32 %add37.prol, i64 0, metadata !26, metadata !32), !dbg !58
  %cmp16.prol = icmp ugt i32 %add37.prol, 40960000, !dbg !59
  %prol.iter91.sub = sub i32 %prol.iter91, 1, !dbg !61
  %prol.iter91.cmp = icmp ne i32 %prol.iter91.sub, 0, !dbg !61
  br i1 %prol.iter91.cmp, label %for.body18.prol, label %for.body18.preheader.split.loopexit, !llvm.loop !68

for.body18.preheader.split.loopexit:              ; preds = %for.inc.prol
  %j.071.unr.ph = phi i32 [ %add37.prol, %for.inc.prol ]
  br label %for.body18.preheader.split

for.body18.preheader.split:                       ; preds = %for.body18.preheader.split.loopexit, %for.body18.preheader
  %j.071.unr = phi i32 [ %add14, %for.body18.preheader ], [ %j.071.unr.ph, %for.body18.preheader.split.loopexit ]
  %10 = icmp ult i32 %5, 2
  br i1 %10, label %for.inc39.loopexit, label %for.body18.preheader.split.split

for.body18.preheader.split.split:                 ; preds = %for.body18.preheader.split
  br label %for.body18, !dbg !62

for.body18:                                       ; preds = %for.inc.1103, %for.body18.preheader.split.split
  %j.071 = phi i32 [ %j.071.unr, %for.body18.preheader.split.split ], [ %add37.1102, %for.inc.1103 ]
  %div69 = lshr i32 %j.071, 5, !dbg !62
  %div20 = zext i32 %div69 to i64, !dbg !62
  %arrayidx21 = getelementptr inbounds i32* %0, i64 %div20, !dbg !62
  %11 = load i32* %arrayidx21, align 4, !dbg !62, !tbaa !49
  %12 = and i32 %j.071, 31, !dbg !62
  %shl25 = shl i32 1, %12, !dbg !62
  %and26 = and i32 %11, %shl25, !dbg !62
  %tobool27 = icmp eq i32 %and26, 0, !dbg !64
  br i1 %tobool27, label %for.inc, label %if.then28, !dbg !64

if.then28:                                        ; preds = %for.body18
  %xor = xor i32 %11, %shl25, !dbg !65
  store i32 %xor, i32* %arrayidx21, align 4, !dbg !65, !tbaa !49
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body18, %if.then28
  %add37 = add i32 %j.071, %i.073, !dbg !67
  tail call void @llvm.dbg.value(metadata i32 %add37, i64 0, metadata !26, metadata !32), !dbg !58
  %div69.193 = lshr i32 %add37, 5, !dbg !62
  %div20.194 = zext i32 %div69.193 to i64, !dbg !62
  %arrayidx21.195 = getelementptr inbounds i32* %0, i64 %div20.194, !dbg !62
  %13 = load i32* %arrayidx21.195, align 4, !dbg !62, !tbaa !49
  %14 = and i32 %add37, 31, !dbg !62
  %shl25.196 = shl i32 1, %14, !dbg !62
  %and26.197 = and i32 %13, %shl25.196, !dbg !62
  %tobool27.198 = icmp eq i32 %and26.197, 0, !dbg !64
  br i1 %tobool27.198, label %for.inc.1103, label %if.then28.1101, !dbg !64

for.inc39.loopexit.unr-lcssa:                     ; preds = %for.inc.1103
  br label %for.inc39.loopexit

for.inc39.loopexit:                               ; preds = %for.body18.preheader.split, %for.inc39.loopexit.unr-lcssa
  br label %for.inc39

for.inc39:                                        ; preds = %for.inc39.loopexit, %if.then13, %for.body8
  %count.1 = phi i32 [ %count.076, %for.body8 ], [ %inc, %if.then13 ], [ %inc, %for.inc39.loopexit ]
  %inc40 = add i32 %i.073, 1, !dbg !70
  tail call void @llvm.dbg.value(metadata i32 %inc40, i64 0, metadata !22, metadata !32), !dbg !43
  %cmp6 = icmp ugt i32 %inc40, 40960000, !dbg !71
  %indvar.next86 = add i32 %indvar85, 1, !dbg !44
  br i1 %cmp6, label %for.body8.lr.ph.1, label %for.body8, !dbg !44

return:                                           ; preds = %entry, %for.end41.2
  %retval.0 = phi i32 [ 0, %for.end41.2 ], [ 1, %entry ]
  ret i32 %retval.0, !dbg !72

for.body8.lr.ph.1:                                ; preds = %for.inc39
  %count.1.lcssa = phi i32 [ %count.1, %for.inc39 ]
  %call42 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 40960000, i32 %count.1.lcssa) #2, !dbg !73
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !19, metadata !32), !dbg !74
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !27, metadata !32), !dbg !40
  tail call void @llvm.dbg.value(metadata i32 40960000, i64 0, metadata !28, metadata !32), !dbg !41
  tail call void @llvm.memset.p0i8.i64(i8* %call, i8 -1, i64 2560004, i32 4, i1 false), !dbg !42
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !22, metadata !32), !dbg !43
  br label %for.body8.1, !dbg !44

for.body8.1:                                      ; preds = %for.inc39.1, %for.body8.lr.ph.1
  %indvar78 = phi i32 [ %indvar.next79, %for.inc39.1 ], [ 0, %for.body8.lr.ph.1 ]
  %count.076.1 = phi i32 [ 0, %for.body8.lr.ph.1 ], [ %count.1.1, %for.inc39.1 ]
  %i.073.1 = phi i32 [ 2, %for.body8.lr.ph.1 ], [ %inc40.1, %for.inc39.1 ]
  %15 = mul i32 %indvar78, -2, !dbg !46
  %16 = add i32 %15, 20479996, !dbg !46
  %17 = add i32 %indvar78, 2, !dbg !46
  %18 = udiv i32 %16, %17, !dbg !46
  %19 = add i32 %18, 1, !dbg !46
  %div.1 = lshr i32 %i.073.1, 5, !dbg !46
  %div10.1 = zext i32 %div.1 to i64, !dbg !46
  %arrayidx.1 = getelementptr inbounds i32* %0, i64 %div10.1, !dbg !46
  %20 = load i32* %arrayidx.1, align 4, !dbg !46, !tbaa !49
  %21 = and i32 %i.073.1, 31, !dbg !46
  %shl.1 = shl i32 1, %21, !dbg !46
  %and.1 = and i32 %20, %shl.1, !dbg !46
  %tobool12.1 = icmp eq i32 %and.1, 0, !dbg !53
  br i1 %tobool12.1, label %for.inc39.1, label %if.then13.1, !dbg !53

if.then13.1:                                      ; preds = %for.body8.1
  %inc.1 = add i32 %count.076.1, 1, !dbg !54
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !27, metadata !32), !dbg !40
  %add14.1 = shl i32 %i.073.1, 1, !dbg !56
  tail call void @llvm.dbg.value(metadata i32 %add14, i64 0, metadata !26, metadata !32), !dbg !58
  %cmp1670.1 = icmp ugt i32 %add14.1, 20480000, !dbg !59
  br i1 %cmp1670.1, label %for.inc39.1, label %for.body18.1.preheader, !dbg !61

for.body18.1.preheader:                           ; preds = %if.then13.1
  %xtraiter80 = and i32 %19, 1
  %lcmp.mod81 = icmp ne i32 %xtraiter80, 0
  %lcmp.overflow82 = icmp eq i32 %19, 0
  %lcmp.or83 = or i1 %lcmp.overflow82, %lcmp.mod81
  br i1 %lcmp.or83, label %for.body18.1.prol.preheader, label %for.body18.1.preheader.split

for.body18.1.prol.preheader:                      ; preds = %for.body18.1.preheader
  br label %for.body18.1.prol, !dbg !62

for.body18.1.prol:                                ; preds = %for.body18.1.prol.preheader, %for.inc.1.prol
  %j.071.1.prol = phi i32 [ %add37.1.prol, %for.inc.1.prol ], [ %add14.1, %for.body18.1.prol.preheader ]
  %prol.iter84 = phi i32 [ %prol.iter84.sub, %for.inc.1.prol ], [ %xtraiter80, %for.body18.1.prol.preheader ]
  %div69.1.prol = lshr i32 %j.071.1.prol, 5, !dbg !62
  %div20.1.prol = zext i32 %div69.1.prol to i64, !dbg !62
  %arrayidx21.1.prol = getelementptr inbounds i32* %0, i64 %div20.1.prol, !dbg !62
  %22 = load i32* %arrayidx21.1.prol, align 4, !dbg !62, !tbaa !49
  %23 = and i32 %j.071.1.prol, 31, !dbg !62
  %shl25.1.prol = shl i32 1, %23, !dbg !62
  %and26.1.prol = and i32 %22, %shl25.1.prol, !dbg !62
  %tobool27.1.prol = icmp eq i32 %and26.1.prol, 0, !dbg !64
  br i1 %tobool27.1.prol, label %for.inc.1.prol, label %if.then28.1.prol, !dbg !64

if.then28.1.prol:                                 ; preds = %for.body18.1.prol
  %xor.1.prol = xor i32 %22, %shl25.1.prol, !dbg !65
  store i32 %xor.1.prol, i32* %arrayidx21.1.prol, align 4, !dbg !65, !tbaa !49
  br label %for.inc.1.prol, !dbg !65

for.inc.1.prol:                                   ; preds = %if.then28.1.prol, %for.body18.1.prol
  %add37.1.prol = add i32 %j.071.1.prol, %i.073.1, !dbg !67
  tail call void @llvm.dbg.value(metadata i32 %add37, i64 0, metadata !26, metadata !32), !dbg !58
  %cmp16.1.prol = icmp ugt i32 %add37.1.prol, 20480000, !dbg !59
  %prol.iter84.sub = sub i32 %prol.iter84, 1, !dbg !61
  %prol.iter84.cmp = icmp ne i32 %prol.iter84.sub, 0, !dbg !61
  br i1 %prol.iter84.cmp, label %for.body18.1.prol, label %for.body18.1.preheader.split.loopexit, !llvm.loop !75

for.body18.1.preheader.split.loopexit:            ; preds = %for.inc.1.prol
  %j.071.1.unr.ph = phi i32 [ %add37.1.prol, %for.inc.1.prol ]
  br label %for.body18.1.preheader.split

for.body18.1.preheader.split:                     ; preds = %for.body18.1.preheader.split.loopexit, %for.body18.1.preheader
  %j.071.1.unr = phi i32 [ %add14.1, %for.body18.1.preheader ], [ %j.071.1.unr.ph, %for.body18.1.preheader.split.loopexit ]
  %24 = icmp ult i32 %19, 2
  br i1 %24, label %for.inc39.1.loopexit, label %for.body18.1.preheader.split.split

for.body18.1.preheader.split.split:               ; preds = %for.body18.1.preheader.split
  br label %for.body18.1, !dbg !62

for.body18.1:                                     ; preds = %for.inc.1.1, %for.body18.1.preheader.split.split
  %j.071.1 = phi i32 [ %j.071.1.unr, %for.body18.1.preheader.split.split ], [ %add37.1.1, %for.inc.1.1 ]
  %div69.1 = lshr i32 %j.071.1, 5, !dbg !62
  %div20.1 = zext i32 %div69.1 to i64, !dbg !62
  %arrayidx21.1 = getelementptr inbounds i32* %0, i64 %div20.1, !dbg !62
  %25 = load i32* %arrayidx21.1, align 4, !dbg !62, !tbaa !49
  %26 = and i32 %j.071.1, 31, !dbg !62
  %shl25.1 = shl i32 1, %26, !dbg !62
  %and26.1 = and i32 %25, %shl25.1, !dbg !62
  %tobool27.1 = icmp eq i32 %and26.1, 0, !dbg !64
  br i1 %tobool27.1, label %for.inc.1, label %if.then28.1, !dbg !64

if.then28.1:                                      ; preds = %for.body18.1
  %xor.1 = xor i32 %25, %shl25.1, !dbg !65
  store i32 %xor.1, i32* %arrayidx21.1, align 4, !dbg !65, !tbaa !49
  br label %for.inc.1, !dbg !65

for.inc.1:                                        ; preds = %if.then28.1, %for.body18.1
  %add37.1 = add i32 %j.071.1, %i.073.1, !dbg !67
  tail call void @llvm.dbg.value(metadata i32 %add37, i64 0, metadata !26, metadata !32), !dbg !58
  %div69.1.1 = lshr i32 %add37.1, 5, !dbg !62
  %div20.1.1 = zext i32 %div69.1.1 to i64, !dbg !62
  %arrayidx21.1.1 = getelementptr inbounds i32* %0, i64 %div20.1.1, !dbg !62
  %27 = load i32* %arrayidx21.1.1, align 4, !dbg !62, !tbaa !49
  %28 = and i32 %add37.1, 31, !dbg !62
  %shl25.1.1 = shl i32 1, %28, !dbg !62
  %and26.1.1 = and i32 %27, %shl25.1.1, !dbg !62
  %tobool27.1.1 = icmp eq i32 %and26.1.1, 0, !dbg !64
  br i1 %tobool27.1.1, label %for.inc.1.1, label %if.then28.1.1, !dbg !64

for.inc39.1.loopexit.unr-lcssa:                   ; preds = %for.inc.1.1
  br label %for.inc39.1.loopexit

for.inc39.1.loopexit:                             ; preds = %for.body18.1.preheader.split, %for.inc39.1.loopexit.unr-lcssa
  br label %for.inc39.1

for.inc39.1:                                      ; preds = %for.inc39.1.loopexit, %if.then13.1, %for.body8.1
  %count.1.1 = phi i32 [ %count.076.1, %for.body8.1 ], [ %inc.1, %if.then13.1 ], [ %inc.1, %for.inc39.1.loopexit ]
  %inc40.1 = add i32 %i.073.1, 1, !dbg !70
  tail call void @llvm.dbg.value(metadata i32 %inc40, i64 0, metadata !22, metadata !32), !dbg !43
  %cmp6.1 = icmp ugt i32 %inc40.1, 20480000, !dbg !71
  %indvar.next79 = add i32 %indvar78, 1, !dbg !44
  br i1 %cmp6.1, label %for.body8.lr.ph.2, label %for.body8.1, !dbg !44

for.body8.lr.ph.2:                                ; preds = %for.inc39.1
  %count.1.1.lcssa = phi i32 [ %count.1.1, %for.inc39.1 ]
  %call42.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 20480000, i32 %count.1.1.lcssa) #2, !dbg !73
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !19, metadata !32), !dbg !74
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !27, metadata !32), !dbg !40
  tail call void @llvm.dbg.value(metadata i32 40960000, i64 0, metadata !28, metadata !32), !dbg !41
  tail call void @llvm.memset.p0i8.i64(i8* %call, i8 -1, i64 1280004, i32 4, i1 false), !dbg !42
  tail call void @llvm.dbg.value(metadata i32 2, i64 0, metadata !22, metadata !32), !dbg !43
  br label %for.body8.2, !dbg !44

for.body8.2:                                      ; preds = %for.inc39.2, %for.body8.lr.ph.2
  %indvar = phi i32 [ %indvar.next, %for.inc39.2 ], [ 0, %for.body8.lr.ph.2 ]
  %count.076.2 = phi i32 [ 0, %for.body8.lr.ph.2 ], [ %count.1.2, %for.inc39.2 ]
  %i.073.2 = phi i32 [ 2, %for.body8.lr.ph.2 ], [ %inc40.2, %for.inc39.2 ]
  %29 = mul i32 %indvar, -2, !dbg !46
  %30 = add i32 %29, 10239996, !dbg !46
  %31 = add i32 %indvar, 2, !dbg !46
  %32 = udiv i32 %30, %31, !dbg !46
  %33 = add i32 %32, 1, !dbg !46
  %div.2 = lshr i32 %i.073.2, 5, !dbg !46
  %div10.2 = zext i32 %div.2 to i64, !dbg !46
  %arrayidx.2 = getelementptr inbounds i32* %0, i64 %div10.2, !dbg !46
  %34 = load i32* %arrayidx.2, align 4, !dbg !46, !tbaa !49
  %35 = and i32 %i.073.2, 31, !dbg !46
  %shl.2 = shl i32 1, %35, !dbg !46
  %and.2 = and i32 %34, %shl.2, !dbg !46
  %tobool12.2 = icmp eq i32 %and.2, 0, !dbg !53
  br i1 %tobool12.2, label %for.inc39.2, label %if.then13.2, !dbg !53

if.then13.2:                                      ; preds = %for.body8.2
  %inc.2 = add i32 %count.076.2, 1, !dbg !54
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !27, metadata !32), !dbg !40
  %add14.2 = shl i32 %i.073.2, 1, !dbg !56
  tail call void @llvm.dbg.value(metadata i32 %add14, i64 0, metadata !26, metadata !32), !dbg !58
  %cmp1670.2 = icmp ugt i32 %add14.2, 10240000, !dbg !59
  br i1 %cmp1670.2, label %for.inc39.2, label %for.body18.2.preheader, !dbg !61

for.body18.2.preheader:                           ; preds = %if.then13.2
  %xtraiter = and i32 %33, 1
  %lcmp.mod = icmp ne i32 %xtraiter, 0
  %lcmp.overflow = icmp eq i32 %33, 0
  %lcmp.or = or i1 %lcmp.overflow, %lcmp.mod
  br i1 %lcmp.or, label %for.body18.2.prol.preheader, label %for.body18.2.preheader.split

for.body18.2.prol.preheader:                      ; preds = %for.body18.2.preheader
  br label %for.body18.2.prol, !dbg !62

for.body18.2.prol:                                ; preds = %for.body18.2.prol.preheader, %for.inc.2.prol
  %j.071.2.prol = phi i32 [ %add37.2.prol, %for.inc.2.prol ], [ %add14.2, %for.body18.2.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.2.prol ], [ %xtraiter, %for.body18.2.prol.preheader ]
  %div69.2.prol = lshr i32 %j.071.2.prol, 5, !dbg !62
  %div20.2.prol = zext i32 %div69.2.prol to i64, !dbg !62
  %arrayidx21.2.prol = getelementptr inbounds i32* %0, i64 %div20.2.prol, !dbg !62
  %36 = load i32* %arrayidx21.2.prol, align 4, !dbg !62, !tbaa !49
  %37 = and i32 %j.071.2.prol, 31, !dbg !62
  %shl25.2.prol = shl i32 1, %37, !dbg !62
  %and26.2.prol = and i32 %36, %shl25.2.prol, !dbg !62
  %tobool27.2.prol = icmp eq i32 %and26.2.prol, 0, !dbg !64
  br i1 %tobool27.2.prol, label %for.inc.2.prol, label %if.then28.2.prol, !dbg !64

if.then28.2.prol:                                 ; preds = %for.body18.2.prol
  %xor.2.prol = xor i32 %36, %shl25.2.prol, !dbg !65
  store i32 %xor.2.prol, i32* %arrayidx21.2.prol, align 4, !dbg !65, !tbaa !49
  br label %for.inc.2.prol, !dbg !65

for.inc.2.prol:                                   ; preds = %if.then28.2.prol, %for.body18.2.prol
  %add37.2.prol = add i32 %j.071.2.prol, %i.073.2, !dbg !67
  tail call void @llvm.dbg.value(metadata i32 %add37, i64 0, metadata !26, metadata !32), !dbg !58
  %cmp16.2.prol = icmp ugt i32 %add37.2.prol, 10240000, !dbg !59
  %prol.iter.sub = sub i32 %prol.iter, 1, !dbg !61
  %prol.iter.cmp = icmp ne i32 %prol.iter.sub, 0, !dbg !61
  br i1 %prol.iter.cmp, label %for.body18.2.prol, label %for.body18.2.preheader.split.loopexit, !llvm.loop !76

for.body18.2.preheader.split.loopexit:            ; preds = %for.inc.2.prol
  %j.071.2.unr.ph = phi i32 [ %add37.2.prol, %for.inc.2.prol ]
  br label %for.body18.2.preheader.split

for.body18.2.preheader.split:                     ; preds = %for.body18.2.preheader.split.loopexit, %for.body18.2.preheader
  %j.071.2.unr = phi i32 [ %add14.2, %for.body18.2.preheader ], [ %j.071.2.unr.ph, %for.body18.2.preheader.split.loopexit ]
  %38 = icmp ult i32 %33, 2
  br i1 %38, label %for.inc39.2.loopexit, label %for.body18.2.preheader.split.split

for.body18.2.preheader.split.split:               ; preds = %for.body18.2.preheader.split
  br label %for.body18.2, !dbg !62

for.body18.2:                                     ; preds = %for.inc.2.1, %for.body18.2.preheader.split.split
  %j.071.2 = phi i32 [ %j.071.2.unr, %for.body18.2.preheader.split.split ], [ %add37.2.1, %for.inc.2.1 ]
  %div69.2 = lshr i32 %j.071.2, 5, !dbg !62
  %div20.2 = zext i32 %div69.2 to i64, !dbg !62
  %arrayidx21.2 = getelementptr inbounds i32* %0, i64 %div20.2, !dbg !62
  %39 = load i32* %arrayidx21.2, align 4, !dbg !62, !tbaa !49
  %40 = and i32 %j.071.2, 31, !dbg !62
  %shl25.2 = shl i32 1, %40, !dbg !62
  %and26.2 = and i32 %39, %shl25.2, !dbg !62
  %tobool27.2 = icmp eq i32 %and26.2, 0, !dbg !64
  br i1 %tobool27.2, label %for.inc.2, label %if.then28.2, !dbg !64

if.then28.2:                                      ; preds = %for.body18.2
  %xor.2 = xor i32 %39, %shl25.2, !dbg !65
  store i32 %xor.2, i32* %arrayidx21.2, align 4, !dbg !65, !tbaa !49
  br label %for.inc.2, !dbg !65

for.inc.2:                                        ; preds = %if.then28.2, %for.body18.2
  %add37.2 = add i32 %j.071.2, %i.073.2, !dbg !67
  tail call void @llvm.dbg.value(metadata i32 %add37, i64 0, metadata !26, metadata !32), !dbg !58
  %div69.2.1 = lshr i32 %add37.2, 5, !dbg !62
  %div20.2.1 = zext i32 %div69.2.1 to i64, !dbg !62
  %arrayidx21.2.1 = getelementptr inbounds i32* %0, i64 %div20.2.1, !dbg !62
  %41 = load i32* %arrayidx21.2.1, align 4, !dbg !62, !tbaa !49
  %42 = and i32 %add37.2, 31, !dbg !62
  %shl25.2.1 = shl i32 1, %42, !dbg !62
  %and26.2.1 = and i32 %41, %shl25.2.1, !dbg !62
  %tobool27.2.1 = icmp eq i32 %and26.2.1, 0, !dbg !64
  br i1 %tobool27.2.1, label %for.inc.2.1, label %if.then28.2.1, !dbg !64

for.inc39.2.loopexit.unr-lcssa:                   ; preds = %for.inc.2.1
  br label %for.inc39.2.loopexit

for.inc39.2.loopexit:                             ; preds = %for.body18.2.preheader.split, %for.inc39.2.loopexit.unr-lcssa
  br label %for.inc39.2

for.inc39.2:                                      ; preds = %for.inc39.2.loopexit, %if.then13.2, %for.body8.2
  %count.1.2 = phi i32 [ %count.076.2, %for.body8.2 ], [ %inc.2, %if.then13.2 ], [ %inc.2, %for.inc39.2.loopexit ]
  %inc40.2 = add i32 %i.073.2, 1, !dbg !70
  tail call void @llvm.dbg.value(metadata i32 %inc40, i64 0, metadata !22, metadata !32), !dbg !43
  %cmp6.2 = icmp ugt i32 %inc40.2, 10240000, !dbg !71
  %indvar.next = add i32 %indvar, 1, !dbg !44
  br i1 %cmp6.2, label %for.end41.2, label %for.body8.2, !dbg !44

for.end41.2:                                      ; preds = %for.inc39.2
  %count.1.2.lcssa = phi i32 [ %count.1.2, %for.inc39.2 ]
  %call42.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 10240000, i32 %count.1.2.lcssa) #2, !dbg !73
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !19, metadata !32), !dbg !74
  tail call void @free(i8* %call) #2, !dbg !77
  br label %return, !dbg !78

if.then28.2.1:                                    ; preds = %for.inc.2
  %xor.2.1 = xor i32 %41, %shl25.2.1, !dbg !65
  store i32 %xor.2.1, i32* %arrayidx21.2.1, align 4, !dbg !65, !tbaa !49
  br label %for.inc.2.1, !dbg !65

for.inc.2.1:                                      ; preds = %if.then28.2.1, %for.inc.2
  %add37.2.1 = add i32 %add37.2, %i.073.2, !dbg !67
  tail call void @llvm.dbg.value(metadata i32 %add37, i64 0, metadata !26, metadata !32), !dbg !58
  %cmp16.2.1 = icmp ugt i32 %add37.2.1, 10240000, !dbg !59
  br i1 %cmp16.2.1, label %for.inc39.2.loopexit.unr-lcssa, label %for.body18.2, !dbg !61

if.then28.1.1:                                    ; preds = %for.inc.1
  %xor.1.1 = xor i32 %27, %shl25.1.1, !dbg !65
  store i32 %xor.1.1, i32* %arrayidx21.1.1, align 4, !dbg !65, !tbaa !49
  br label %for.inc.1.1, !dbg !65

for.inc.1.1:                                      ; preds = %if.then28.1.1, %for.inc.1
  %add37.1.1 = add i32 %add37.1, %i.073.1, !dbg !67
  tail call void @llvm.dbg.value(metadata i32 %add37, i64 0, metadata !26, metadata !32), !dbg !58
  %cmp16.1.1 = icmp ugt i32 %add37.1.1, 20480000, !dbg !59
  br i1 %cmp16.1.1, label %for.inc39.1.loopexit.unr-lcssa, label %for.body18.1, !dbg !61

if.then28.1101:                                   ; preds = %for.inc
  %xor.1100 = xor i32 %13, %shl25.196, !dbg !65
  store i32 %xor.1100, i32* %arrayidx21.195, align 4, !dbg !65, !tbaa !49
  br label %for.inc.1103, !dbg !65

for.inc.1103:                                     ; preds = %if.then28.1101, %for.inc
  %add37.1102 = add i32 %add37, %i.073, !dbg !67
  tail call void @llvm.dbg.value(metadata i32 %add37, i64 0, metadata !26, metadata !32), !dbg !58
  %cmp16.1 = icmp ugt i32 %add37.1102, 40960000, !dbg !59
  br i1 %cmp16.1, label %for.inc39.loopexit.unr-lcssa, label %for.body18, !dbg !61
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!29, !30}
!llvm.ident = !{!31}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !7, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c] [DW_LANG_C99]
!1 = !{!"nsieve-bits.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from bits]
!5 = !{!"0x16\00bits\0011\000\000\000\000", !1, null, !6} ; [ DW_TAG_typedef ] [bits] [line 11, size 0, align 0, offset 0] [from unsigned int]
!6 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!7 = !{!8}
!8 = !{!"0x2e\00main\00main\00\0018\000\001\000\000\00256\001\0019", !1, !9, !10, null, i32 (i32, i8**)* @main, null, null, !16} ; [ DW_TAG_subprogram ] [line 18] [def] [scope 19] [main]
!9 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!10 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !11, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = !{!12, !12, !13}
!12 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!13 = !{!"0xf\00\000\0064\0064\000\000", null, null, !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!14 = !{!"0xf\00\000\0064\0064\000\000", null, null, !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!15 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!16 = !{!17, !18, !19, !20, !21, !22, !26, !27, !28}
!17 = !{!"0x101\00argc\0016777234\000", !8, !9, !12} ; [ DW_TAG_arg_variable ] [argc] [line 18]
!18 = !{!"0x101\00argv\0033554450\000", !8, !9, !13} ; [ DW_TAG_arg_variable ] [argv] [line 18]
!19 = !{!"0x100\00m\0020\000", !8, !9, !6}        ; [ DW_TAG_auto_variable ] [m] [line 20]
!20 = !{!"0x100\00sz\0020\000", !8, !9, !6}       ; [ DW_TAG_auto_variable ] [sz] [line 20]
!21 = !{!"0x100\00primes\0021\000", !8, !9, !4}   ; [ DW_TAG_auto_variable ] [primes] [line 21]
!22 = !{!"0x100\00i\0024\000", !23, !9, !6}       ; [ DW_TAG_auto_variable ] [i] [line 24]
!23 = !{!"0xb\0023\0028\003", !1, !24}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!24 = !{!"0xb\0023\003\002", !1, !25}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!25 = !{!"0xb\0023\003\001", !1, !8}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!26 = !{!"0x100\00j\0024\000", !23, !9, !6}       ; [ DW_TAG_auto_variable ] [j] [line 24]
!27 = !{!"0x100\00count\0024\000", !23, !9, !6}   ; [ DW_TAG_auto_variable ] [count] [line 24]
!28 = !{!"0x100\00n\0024\000", !23, !9, !6}       ; [ DW_TAG_auto_variable ] [n] [line 24]
!29 = !{i32 2, !"Dwarf Version", i32 4}
!30 = !{i32 2, !"Debug Info Version", i32 2}
!31 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!32 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!33 = !MDLocation(line: 18, column: 14, scope: !8)
!34 = !MDLocation(line: 18, column: 27, scope: !8)
!35 = !MDLocation(line: 20, column: 19, scope: !8)
!36 = !MDLocation(line: 21, column: 26, scope: !8)
!37 = !MDLocation(line: 21, column: 18, scope: !8)
!38 = !MDLocation(line: 21, column: 9, scope: !8)
!39 = !MDLocation(line: 22, column: 7, scope: !8)
!40 = !MDLocation(line: 24, column: 24, scope: !23)
!41 = !MDLocation(line: 24, column: 35, scope: !23)
!42 = !MDLocation(line: 25, column: 5, scope: !23)
!43 = !MDLocation(line: 24, column: 18, scope: !23)
!44 = !MDLocation(line: 26, column: 5, scope: !45)
!45 = !{!"0xb\0026\005\004", !1, !23}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!46 = !MDLocation(line: 27, column: 11, scope: !47)
!47 = !{!"0xb\0027\0011\006", !1, !48}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!48 = !{!"0xb\0026\005\005", !1, !45}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!49 = !{!50, !50, i64 0}
!50 = !{!"int", !51, i64 0}
!51 = !{!"omnipotent char", !52, i64 0}
!52 = !{!"Simple C/C++ TBAA"}
!53 = !MDLocation(line: 27, column: 11, scope: !48)
!54 = !MDLocation(line: 28, column: 2, scope: !55)
!55 = !{!"0xb\0027\0029\007", !1, !47}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!56 = !MDLocation(line: 29, column: 11, scope: !57)
!57 = !{!"0xb\0029\002\008", !1, !55}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!58 = !MDLocation(line: 24, column: 21, scope: !23)
!59 = !MDLocation(line: 29, column: 18, scope: !60)
!60 = !{!"0xb\0029\002\009", !1, !57}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!61 = !MDLocation(line: 29, column: 2, scope: !57)
!62 = !MDLocation(line: 30, column: 8, scope: !63)
!63 = !{!"0xb\0030\008\0010", !1, !60}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!64 = !MDLocation(line: 30, column: 8, scope: !60)
!65 = !MDLocation(line: 30, column: 26, scope: !66)
!66 = !{!"0xb\001", !1, !63}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/nsieve-bits.c]
!67 = !MDLocation(line: 29, column: 26, scope: !60)
!68 = distinct !{!68, !69}
!69 = !{!"llvm.loop.unroll.disable"}
!70 = !MDLocation(line: 26, column: 25, scope: !48)
!71 = !MDLocation(line: 26, column: 17, scope: !48)
!72 = !MDLocation(line: 36, column: 1, scope: !8)
!73 = !MDLocation(line: 32, column: 5, scope: !23)
!74 = !MDLocation(line: 20, column: 16, scope: !8)
!75 = distinct !{!75, !69}
!76 = distinct !{!76, !69}
!77 = !MDLocation(line: 34, column: 3, scope: !8)
!78 = !MDLocation(line: 35, column: 3, scope: !8)
