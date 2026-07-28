import BifurcationTheoryPdesManifoldsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

structure LinearizationPackage (A : AdmissibleClass) where
  linearizedOp : (A.object.manifoldType → ℝ) → (A.object.manifoldType → ℝ)
  fredholmProperty : Prop
  kernelBasis : List (A.object.manifoldType → ℝ)
  cokernelDimension : ℕ
  normalNondegeneracy : Prop

structure LinearizationEvidence (A : AdmissibleClass) (L : LinearizationPackage A) where
  fredholmPropertyClosed : L.fredholmProperty
  kernelBasisClosed : L.kernelBasis.length = A.object.kernelDimension
  cokernelDimensionClosed : L.cokernelDimension = 0
  normalNondegeneracyClosed : L.normalNondegeneracy

def LinearizationClosed (A : AdmissibleClass) (L : LinearizationPackage A) : Prop :=
  L.fredholmProperty ∧ (L.kernelBasis.length = A.object.kernelDimension) ∧ (L.cokernelDimension = 0) ∧ L.normalNondegeneracy

theorem linearization_closed_from_evidence (A : AdmissibleClass) (L : LinearizationPackage A) (E : LinearizationEvidence A L) : LinearizationClosed A L := by
  exact And.intro E.fredholmPropertyClosed (And.intro E.kernelBasisClosed (And.intro E.cokernelDimensionClosed E.normalNondegeneracyClosed))

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse