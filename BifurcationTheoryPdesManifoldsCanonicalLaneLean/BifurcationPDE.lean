import HautevilleHouse.BifurcationTheoryPdesManifoldsCanonicalLaneLean.BifurcationManifold

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

structure BifurcationPDEPackage (M : BifurcationManifoldPackage) where
  parameterSpace : Type u
  parameterTopology : TopologicalSpace parameterSpace
  equationFamily : parameterSpace → Prop
  linearization : Prop
  fredholmProperty : Prop
  bifurcationCondition : Prop

structure BifurcationPDEEvidence {M : BifurcationManifoldPackage} (F : BifurcationPDEPackage M) where
  equationFamilyClosed : ∀ p : F.parameterSpace, F.equationFamily p
  linearizationClosed : F.linearization
  fredholmPropertyClosed : F.fredholmProperty
  bifurcationConditionClosed : F.bifurcationCondition

def BifurcationPDEClosed {M : BifurcationManifoldPackage} (F : BifurcationPDEPackage M) : Prop :=
  (∀ p : F.parameterSpace, F.equationFamily p) ∧ F.linearization ∧ F.fredholmProperty ∧ F.bifurcationCondition

theorem bifurcation_pde_closed_from_evidence {M : BifurcationManifoldPackage}
    (F : BifurcationPDEPackage M) (E : BifurcationPDEEvidence F) : BifurcationPDEClosed F := by
  exact And.intro E.equationFamilyClosed
    (And.intro E.linearizationClosed
      (And.intro E.fredholmPropertyClosed E.bifurcationConditionClosed))

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse
