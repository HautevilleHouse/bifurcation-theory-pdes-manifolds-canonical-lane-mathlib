import BifurcationTheoryPdesManifoldsCanonicalLaneLean.CenterManifoldPackage

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

structure LyapunovSchmidtReductionPackage {A : AdmissibleClass} {L : LinearizationPackage A} {C : CenterManifoldPackage L} where
  projectionOntoKernel : (A.object.manifoldType → ℝ) → A.object.kernelDimension → ℝ
  bifurcationEquation : (A.object.manifoldType → ℝ) → (A.object.manifoldType → ℝ)
  finiteDimensionalReduction : Prop
  nondegeneracyCondition : Prop

structure LyapunovSchmidtReductionEvidence {A : AdmissibleClass} {L : LinearizationPackage A} {C : CenterManifoldPackage L} (R : LyapunovSchmidtReductionPackage C) where
  finiteDimensionalReductionClosed : R.finiteDimensionalReduction
  nondegeneracyConditionClosed : R.nondegeneracyCondition

def LyapunovSchmidtReductionClosed {A : AdmissibleClass} {L : LinearizationPackage A} {C : CenterManifoldPackage L} (R : LyapunovSchmidtReductionPackage C) : Prop :=
  R.finiteDimensionalReduction ∧ R.nondegeneracyCondition

theorem lyapunov_schmidt_reduction_closed_from_evidence {A : AdmissibleClass} {L : LinearizationPackage A} {C : CenterManifoldPackage L} (R : LyapunovSchmidtReductionPackage C) (E : LyapunovSchmidtReductionEvidence R) : LyapunovSchmidtReductionClosed R := by
  exact And.intro E.finiteDimensionalReductionClosed E.nondegeneracyConditionClosed

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse