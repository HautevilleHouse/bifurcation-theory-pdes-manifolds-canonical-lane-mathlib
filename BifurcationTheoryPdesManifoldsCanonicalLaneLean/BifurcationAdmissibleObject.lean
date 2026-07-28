import BifurcationTheoryPdesManifoldsCanonicalLaneLean.Basic

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

structure BifurcationPoincareSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure BifurcationAdmittedObject where
  space : BifurcationPoincareSpace
  pdeParameterSpace : Type
  parameterTopology : TopologicalSpace pdeParameterSpace
  bifurcationEquation : (pdeParameterSpace → space.carrier → ℝ) → Prop
  parameterFamily : pdeParameterSpace → space.carrier → ℝ
  bifurcationPoint : pdeParameterSpace
  linearizationInvertible : Prop
  conclusion : linearizationInvertible

structure BifurcationEndgameState where
  object : BifurcationAdmittedObject

def BifurcationWitnessClosed (O : BifurcationAdmittedObject) : Prop :=
  O.linearizationInvertible

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse